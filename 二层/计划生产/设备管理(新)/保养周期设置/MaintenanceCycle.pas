unit MaintenanceCycle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Menus;

type
  TFrm_MaintenanceCycle = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    function find_DeviType(DeviType:string):Boolean;
    function returen_rkey816list():string;
    { Private declarations }
  public
    v_status : Integer;
    rkey811:string;
    { Public declarations }
  end;

var
  Frm_MaintenanceCycle: TFrm_MaintenanceCycle;

implementation

uses MainCyclDefinition, damo;

{$R *.dfm}

{ TFrm_MaintenanceCycle }

function TFrm_MaintenanceCycle.returen_rkey816list: string;
var
  rkey816list:string;
  i:integer;
begin
 rkey816list:='(';
for i:= 1 to StringGrid1.RowCount-2 do
 if i=StringGrid1.RowCount-2 then
  rkey816list:=rkey816list+STRINGgrid1.Cells[2,i]+')'
 else
  rkey816list:=rkey816list+STRINGgrid1.Cells[2,i]+',';

 returen_rkey816list:=rkey816list;

end;

procedure TFrm_MaintenanceCycle.N1Click(Sender: TObject);
begin
  try
    frm_MainCyclDefinition:=Tfrm_MainCyclDefinition.Create(Application);

    if StringGrid1.RowCount>2 then
      frm_MainCyclDefinition.ADS816.CommandText:=frm_MainCyclDefinition.ADS816.CommandText+
      ' and (rkey not in'+self.returen_rkey816list+')';
//    frm_MainCyclDefinition.Enter(0);

    if frm_MainCyclDefinition.ShowModal=mrok then
    begin
      frm_MainCyclDefinition.ADS816.First;
      while not frm_MainCyclDefinition.ADS816.Eof do
      begin
        StringGrid1.Cells[0,StringGrid1.RowCount-1]:=frm_MainCyclDefinition.ADS816MainCycl.Value;
        StringGrid1.Cells[1,StringGrid1.RowCount-1]:=frm_MainCyclDefinition.ADS816cycl_duration.AsString;
        StringGrid1.Cells[2,StringGrid1.RowCount-1]:=frm_MainCyclDefinition.ADS816rkey.AsString;
        StringGrid1.RowCount:=StringGrid1.RowCount+1;
        frm_MainCyclDefinition.ADS816.Next;
      end;
    end;
  finally
    frm_MainCyclDefinition.Free;
  end;
end;

procedure TFrm_MaintenanceCycle.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    stringgrid1.MouseToCell(x,y,column,row);
    if row<>0 then
      stringgrid1.Row:=row;
  end;
end;

procedure TFrm_MaintenanceCycle.PopupMenu1Popup(Sender: TObject);
begin
  if stringgrid1.Row= stringgrid1.RowCount-1 then
    n2.Enabled:=false
  else
    n2.Enabled:=true;
end;

procedure TFrm_MaintenanceCycle.N2Click(Sender: TObject);
var
  i:integer;
begin
  for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
    stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TFrm_MaintenanceCycle.FormShow(Sender: TObject);
var
  i:Integer;
begin
  StringGrid1.Cells[0,0] := '保养周期';
  StringGrid1.Cells[1,0] := '周期时间';
  StringGrid1.Cells[3,0] := '保养提前通知天数';
  StringGrid1.ColWidths[2] := 0;
  if v_status=1 then
    Edit1.Text := DM.ADS811DeviType.Value;
  if (v_status=1) or (v_status=2) then
  begin
    Edit2.Text := DM.ADS811TypeName.Value;
    Edit3.Text := DM.ADS811TypeDesc.Value;
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Text := 'SELECT Data0816.Rkey,data0811.DeviType,Data0816.MainCycl,Data0816.cycl_duration,data0812.AdvanceDays '+
      ' FROM data0812 INNER JOIN data0811'+
      ' ON data0812.DeviType = data0811.DeviType INNER JOIN Data0816 ON data0812.MainCycl = Data0816.MainCycl'+
      ' where data0811.DeviType='+QuotedStr(dm.ADS811DeviType.AsString);
      Open;
      First;
      for i:=1 to DM.ADOQuery1.RecordCount do
      begin
        StringGrid1.Cells[0,i] := FieldByName('MainCycl').Value;
        StringGrid1.Cells[1,i] := FieldByName('cycl_duration').Value;
        StringGrid1.Cells[2,i] := FieldByName('Rkey').Value  ;
        if FieldByName('AdvanceDays').Value <> null then
          StringGrid1.Cells[3,i] := FieldByName('AdvanceDays').Value  ;
        StringGrid1.RowCount:=StringGrid1.RowCount+1;
        Next;
      end;

    end;
  end;
  if v_status=1 then
    Edit1.Enabled := False
  else
    Edit1.Enabled := True;
end;

function TFrm_MaintenanceCycle.find_DeviType(DeviType: string): Boolean;
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select DeviType from data0811 where DeviType='''+DeviType+'''';
    open;
    if IsEmpty then
      Result:=False
    else
      Result:=true;
  end;
end;

procedure TFrm_MaintenanceCycle.BitBtn1Click(Sender: TObject);
var
  i:Integer;
  equal:Boolean;
begin
  if trim(edit1.Text) = '' then
  begin
   messagedlg('保养类型不能为空!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
   exit;
  end;
  if trim(edit2.Text) = '' then
  begin
   messagedlg('类型名称不能为空!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
   exit;
  end;
//  if trim(edit3.Text) = '' then
//  begin
//   messagedlg('类型描述不能为空!',mtinformation,[mbcancel],0);
//   edit2.SetFocus;
//   exit;
//  end;
  if StringGrid1.RowCount<=2 then
  begin
   messagedlg('保养周期不能为空!',mtinformation,[mbcancel],0);
   StringGrid1.SetFocus;
   exit;
  end;
  if (v_status=0) or (v_status=2) then
  begin
    if self.find_DeviType(Edit1.Text) then
    begin
     messagedlg('保养类型重复,请重新输入!',mtinformation,[mbcancel],0);
     edit1.SetFocus;
     exit;
    end;
    try
      DM.ADOConnection1.BeginTrans;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text :='select DeviType,TypeName,TypeDesc from data0811 where DeviType is null';
        Open;
        Append;
        FieldByName('DeviType').Value := Edit1.Text;
        FieldByName('TypeName').Value := Edit2.Text;
        FieldByName('TypeDesc').Value := Edit3.Text;
        Post;
        rkey811 := FieldByName('DeviType').Value;
      end;

      with DM.ADOQuery1 do
      begin
        for i:=1 to stringgrid1.RowCount-2  do
        begin
          Close;
          if Trim(StringGrid1.Cells[3,i]) <> '' then
            SQL.Text := 'insert into data0812(DeviType,MainCycl,cycl_duration,AdvanceDays) values('+QuotedStr(Edit1.Text)+
                        ','+QuotedStr(stringgrid1.Cells[0,i])+','+QuotedStr(stringgrid1.Cells[1,i])+','+QuotedStr(stringgrid1.Cells[3,i])+')'
          else
             SQL.Text := 'insert into data0812(DeviType,MainCycl,cycl_duration) values('+QuotedStr(Edit1.Text)+
                        ','+QuotedStr(stringgrid1.Cells[0,i])+','+QuotedStr(stringgrid1.Cells[1,i])+')';
          ExecSQL;
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end
  end
  else if v_status=1 then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      equal:=False;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text :='select DeviType,TypeName,TypeDesc from data0811 where DeviType = '+QuotedStr(DM.ADS811DeviType.AsString);
        Open;
        Edit;
        FieldByName('DeviType').Value := Edit1.Text;
        FieldByName('TypeName').Value := Edit2.Text;
        FieldByName('TypeDesc').Value := Edit3.Text;
        Post;
      end;
 //下面被注释代码已经引用的保养类型不能删除     
//      with DM.ADOQuery1 do
//      begin
//        Close;
//        SQL.Text :='delete data0812 where DeviType ='+QuotedStr(DM.ADS811DeviType.AsString);
//        ExecSQL;
//      end;
//
//      with DM.ADOQuery1 do
//      begin
//        for i:=1 to stringgrid1.RowCount-2  do
//        begin
//          Close;
//          if Trim(StringGrid1.Cells[3,i]) <> '' then
//          begin
//            SQL.Text := 'insert into data0812(DeviType,MainCycl,cycl_duration,AdvanceDays) values('+QuotedStr(Edit1.Text)+
//                        ','+QuotedStr(stringgrid1.Cells[0,i])+','+QuotedStr(stringgrid1.Cells[1,i])+','+QuotedStr(stringgrid1.Cells[3,i])+')';
//          end
//          else
//          begin
//             SQL.Text := 'insert into data0812(DeviType,MainCycl,cycl_duration) values('+QuotedStr(Edit1.Text)+
//                        ','+QuotedStr(stringgrid1.Cells[0,i])+','+QuotedStr(stringgrid1.Cells[1,i])+')';
//          end;
//          ExecSQL;
//        end;
//      end;

      for i := 1 to StringGrid1.RowCount-2 do
      begin
        DM.ADS812.First;
        while not DM.ADS812.Eof do
        begin
          if DM.ADS812MainCycl.Value= StringGrid1.Cells[0,i] then
          begin
            DM.ADS812.Next;
            equal := True;
            Break;
          end;
          DM.ADS812.Next;
        end;
        if equal=True then
        begin
          equal := False;
          with DM.ADOQuery1 do
          begin
            Close;
            if Trim(StringGrid1.Cells[3,i]) <> '' then
            begin
              SQL.Text := 'update data0812 set AdvanceDays = ' + StringGrid1.Cells[3,i] + ' where MainCycl = ' +
                          QuotedStr(StringGrid1.Cells[0,i]) + ' and DeviType = ' + QuotedStr(Edit1.Text);
            end
            else
            begin
              SQL.Text := 'update data0812 set AdvanceDays = null where MainCycl = ' +
                          QuotedStr(StringGrid1.Cells[0,i]) + ' and DeviType = ' + QuotedStr(Edit1.Text);
            end;
            ExecSQL;
          end;
          Continue;
        end;
        with DM.ADOQuery1 do
        begin
          Close;
          if Trim(StringGrid1.Cells[3,i]) <> '' then
          begin
            SQL.Text := 'insert into data0812(DeviType,MainCycl,cycl_duration,AdvanceDays) values('+QuotedStr(Edit1.Text)+
                        ','+QuotedStr(stringgrid1.Cells[0,i])+','+QuotedStr(stringgrid1.Cells[1,i])+','+QuotedStr(stringgrid1.Cells[3,i])+')';
          end
          else
          begin
            SQL.Text := 'insert into data0812(DeviType,MainCycl,cycl_duration) values('+QuotedStr(Edit1.Text)+
                        ','+QuotedStr(stringgrid1.Cells[0,i])+','+QuotedStr(stringgrid1.Cells[1,i])+')';
          end;
          ExecSQL;
        end;
      end;

      DM.ADS812.First;
      while not DM.ADS812.Eof do
      begin
        for i := 1 to StringGrid1.RowCount-2 do
        begin
          if DM.ADS812MainCycl.Value= StringGrid1.Cells[0,i] then
          begin
            DM.ADS812.Next;
            equal := True;
            Break;
          end;
        end;
        if equal=True then
        begin
          equal := False;
          Continue;
        end;

        with DM.ADOQuery1 do
        begin
          Close;
          SQL.Text :='delete data0812 where DeviType ='+QuotedStr(DM.ADS811DeviType.AsString)+
          ' and MainCycl ='+ QuotedStr(dm.ADS812MainCycl.AsString);
          ExecSQL;
        end;
        DM.ADS812.Next;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('可能是删除的保养周期已经在保养计划中引用，请先删除该保养计划再修改');
//        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end
  end;
end;

procedure TFrm_MaintenanceCycle.StringGrid1SelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
 if acol=3 then
   StringGrid1.Options:=StringGrid1.Options+[goEditing]
 else
   StringGrid1.Options:=StringGrid1.Options-[goEditing];
end;

procedure TFrm_MaintenanceCycle.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort//判断是否输入数字
end;

end.
