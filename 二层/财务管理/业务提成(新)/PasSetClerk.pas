unit PasSetClerk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus;

type
  TfrmSetClerk = class(TForm)
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    strSQL:string;
    { Private declarations }
    procedure showSG;
  public
    { Public declarations }
  end;

var
  frmSetClerk: TfrmSetClerk;
  str_list:TStringList;

implementation

uses common,PasDM;

{$R *.dfm}
procedure TfrmSetClerk.showSG;
var j,i:integer;
begin
  StringGrid1.Update;
  for j :=StringGrid1.RowCount-1  downto 1  do
  begin
    for i:=0 to StringGrid1.ColCount do
    begin
      StringGrid1.Cells[i,j]:='';
    end;
    stringgrid1.rowcount := stringgrid1.rowcount - 1;
  end;
  str_list := TStringList.Create;
  str_list.Add('客户代码=CUST_CODE');
  str_list.Add('客户简称=ABBR_NAME');
  str_list.Add('业务员=EMPLOYEE_NAME');
  str_list.Add('付款方式=FED_TAX_ID_NO');
  str_list.Add('币种=CURR_NAME');
  str_list.Add('Rkey=Rkey');
  str_list.Add('提成比例=Proportion');
  str_list.Add('代理费用=brokerage');
  str_list.Add('备注=Remark');
  str_list.Add('状态=status_s');
  StringGrid1.ColCount:=str_list.Count;
  for j := 0 to str_list.Count-1  do    //SGrd添加第一行的字段名
  begin
    StringGrid1.Cells[j,0] := str_list.Names[j];
  end;
  if (Trim(Edit1.Text)='') then
  begin
  DM.Ado10.Close;
  dm.Ado10.SQL.Text:=strSQL;
  dm.Ado10.Open;
  end else if (Trim(Edit1.Text)<>'') and (Edit1.Tag=0) then
  begin
  DM.Ado10.Close;
  dm.Ado10.SQL.Text:=strSQL+' where CUST_CODE='''+Trim(Edit1.Text)+'''';
  dm.Ado10.Open;
  end else if (Trim(Edit1.Text)<>'') and (Edit1.Tag=1) then
  begin
  DM.Ado10.Close;
  dm.Ado10.SQL.Text:=strSQL+' where Data0010.ABBR_NAME like ''%'+Trim(Edit1.Text)+'%''';
  dm.Ado10.Open;
  end else if (Trim(Edit1.Text)<>'') and (Edit1.Tag=2) then
  begin
  DM.Ado10.Close;
  dm.Ado10.SQL.Text:=strSQL+' where EMPLOYEE_NAME like ''%'+Trim(Edit1.Text)+'%''';
  dm.Ado10.Open;
  end;
  if (dm.Ado10.RecordCount=0) then StringGrid1.RowCount:=2 else
  StringGrid1.RowCount:=dm.Ado10.RecordCount+1;
  StringGrid1.FixedRows:=1;
  StringGrid1.ColWidths[1]:=100;
  StringGrid1.ColWidths[3]:=120;
  StringGrid1.ColWidths[5]:=-1;
  StringGrid1.ColWidths[6]:=80;
  StringGrid1.ColWidths[7]:=80;
  StringGrid1.ColWidths[8]:=90;
  i:=0;
  if not dm.Ado10.IsEmpty then
  begin
    dm.Ado10.First;
    while not dm.Ado10.Eof do
    begin
      for j := 0 to str_list.Count -1 do
      begin
        if (DM.Ado10.FieldByName(str_list.Values[StringGrid1.Cells[j,0]]).IsNull = False) then
          StringGrid1.Cells[j,i+1] := DM.Ado10.FieldByName(str_list.Values[StringGrid1.Cells[j,0]]).Value;
      end;
      i:=i+1;
      dm.Ado10.Next;
    end;
  end;
  StringGrid1.Col:=6;
end;

procedure TfrmSetClerk.FormShow(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
   StringGrid1.Options := StringGrid1.Options - [goEditing];
   N1.Enabled:=False;
   N2.Enabled:=False;
   N3.Enabled:=False;
   N4.Enabled:=False;
   end
  else
  begin
   StringGrid1.Options := StringGrid1.Options + [goEditing];
   N3.Enabled:=True;
   N4.Enabled:=True;
  end;
  Button1.Tag:=0;
  strSQL:=' SELECT dbo.Data0010.CUST_CODE,  dbo.Data0010.ABBR_NAME, dbo.Data0005.EMPLOYEE_NAME,data0125.Remark,data0125.brokerage,Data0125.iStatus,'
          +'dbo.Data0010.FED_TAX_ID_NO, dbo.Data0001.CURR_NAME, dbo.Data0010.RKEY,Data0125.Proportion,case Data0125.iStatus when 0 then ''未审'' when 1 then ''已审'' end as status_s '
          +'  FROM         dbo.Data0010 INNER JOIN'
          +'            dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0005.RKEY INNER JOIN'
          +'            dbo.Data0001 ON dbo.Data0010.CURRENCY_PTR = dbo.Data0001.RKEY left join'
          +'            Data0125 on Data0010.RKEY=Data0125.Rkey10';
  showSG;
  StringGrid1.Col:=6;
end;

procedure TfrmSetClerk.Button1Click(Sender: TObject);
begin
  if (Trim(Edit1.Text)<>'') then Button1.Tag:=1 else Button1.Tag:=0;
  showSG;
end;

procedure TfrmSetClerk.BitBtn2Click(Sender: TObject);
var i:Integer;
    tmpAdo:TADOQuery;
begin
  tmpAdo:=TADOQuery.Create(Application);
  tmpAdo.Connection:=DM.ADOConnection1;
  DM.tmp.Close;
  dm.tmp.SQL.Text:='select top 1 * from data0125';
  DM.tmp.Open;
  if not dm.tmp.IsEmpty then
  begin
    if dm.tmp.FieldByName('iStatus').AsInteger=1 then
    begin
      ShowMessage('单据已审核不能修改，请先取消审核状态');
      Exit;
    end;
  end;
  if (Trim(StringGrid1.Cells[0,1])='') then Exit;
  try
    try
      dm.ADOConnection1.BeginTrans;
      for i :=1  to StringGrid1.RowCount-1 do
      begin
        if (Trim(StringGrid1.Cells[str_list.IndexOfName('提成比例'),i])='0') and (Trim(StringGrid1.Cells[str_list.IndexOfName('代理费用'),i])='0') then
        begin
          dm.tmp.Close;
          dm.tmp.SQL.Clear;
          DM.tmp.SQL.Text:='delete from data0125 where Rkey10='+StringGrid1.Cells[str_list.IndexOfName('Rkey'),i];
          dm.tmp.ExecSQL;
        end else
        if (Trim(StringGrid1.Cells[str_list.IndexOfName('提成比例'),i])<>'') or (Trim(StringGrid1.Cells[str_list.IndexOfName('代理费用'),i])<>'') then
        begin
          DM.tmp.Close;
          dm.tmp.SQL.Text:='select * from data0125 where Rkey10='+StringGrid1.Cells[str_list.IndexOfName('Rkey'),i];
          DM.tmp.Open;
          if not dm.tmp.IsEmpty then // 已存在编辑
          begin                                                                                                           
            if (StringGrid1.Cells[str_list.IndexOfName('代理费用'),i]='') then StringGrid1.Cells[str_list.IndexOfName('代理费用'),i]:='0';
            if (StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]='') then StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]:='0';
            tmpAdo.Close;
            tmpAdo.SQL.Text:='update Data0125 set Proportion='+StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]
            +',brokerage='+StringGrid1.Cells[str_list.IndexOfName('代理费用'),i]+',Remark='''+StringGrid1.Cells[str_list.IndexOfName('备注'),i]
            +''' where Rkey10='+StringGrid1.Cells[str_list.IndexOfName('Rkey'),i]+'';
            tmpAdo.ExecSQL;
          end else
          begin
            if (StringGrid1.Cells[str_list.IndexOfName('代理费用'),i]='') then StringGrid1.Cells[str_list.IndexOfName('代理费用'),i]:='0';
            if (StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]='') then StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]:='0';
            tmpAdo.Close;
            tmpAdo.SQL.Text:='Insert into data0125 (Rkey10,Proportion,brokerage,Remark) Values(:Rkey10,:Proportion,:brokerage,:Remark)';
            tmpAdo.Parameters.ParamByName('Rkey10').Value:=StringGrid1.Cells[str_list.IndexOfName('Rkey'),i];
            tmpAdo.Parameters.ParamByName('Proportion').Value:=StringGrid1.Cells[str_list.IndexOfName('提成比例'),i];
            tmpAdo.Parameters.ParamByName('brokerage').Value:=StringGrid1.Cells[str_list.IndexOfName('代理费用'),i];
            tmpAdo.Parameters.ParamByName('Remark').Value:=StringGrid1.Cells[str_list.IndexOfName('备注'),i];
            tmpAdo.ExecSQL;
          end;
        end;
      end;
      dm.ADOConnection1.CommitTrans;
    except
      dm.ADOConnection1.RollbackTrans;
      ShowMessage('保存失败！');
      Exit;
    end;
//      if (Trim(StringGrid1.Cells[1,1])='') then Exit;
//      try
//        dm.ADOConnection1.BeginTrans;
//        dm.tmp.Close;
//        DM.tmp.SQL.Clear;
//        if (Trim(Edit1.Text)<>'') and (Edit1.Tag=0) then
//        begin
//        dm.tmp.SQL.Text:='select * from data0125 inner join data0010 on data0125.RKey10=data0010.Rkey where Data0010.CUST_CODE='''+Trim(Edit1.Text)+'''';
//        end else if (Trim(Edit1.Text)<>'') and (Edit1.Tag=1) then
//        begin
//        dm.tmp.SQL.Text:='select * from data0125 inner join data0010 on data0125.RKey10=data0010.Rkey where Data0010.ABBR_NAME ='''+Trim(Edit1.Text)+'''';
//        end else if (Trim(Edit1.Text)<>'') and (Edit1.Tag=2) then
//        begin
//        dm.tmp.SQL.Text:='select * from data0125 inner join data0010 on data0125.RKey10=data0010.Rkey inner join dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0005.RKEY where Data0005.EMPLOYEE_NAME ='''+Trim(Edit1.Text)+'''';
//        end;
//        dm.tmp.Open;
//        if not dm.tmp.IsEmpty then
//        begin
//          dm.tmp.Close;
//          dm.tmp.SQL.Clear;
//          if (Edit1.Tag=0) then
//          DM.tmp.SQL.Text:='delete from Data0125 from data0125 inner join data0010 on data0125.RKey10=data0010.Rkey where CUST_CODE='+Trim(Edit1.Text)+''
//          else if (Edit1.Tag=1) then
//          DM.tmp.SQL.Text:='delete from Data0125 from data0125 inner join data0010 on data0125.RKey10=data0010.Rkey where ABBR_NAME='''+Trim(Edit1.Text)+''''
//          else if (Edit1.Tag=2) then
//          DM.tmp.SQL.Text:='delete from Data0125 from data0125 inner join data0010 on data0125.RKey10=data0010.Rkey inner join dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0005.RKEY where EMPLOYEE_NAME='''+Trim(Edit1.Text)+'''';
//          dm.tmp.ExecSQL;
//
//          for i :=1  to StringGrid1.RowCount-1 do
//          begin
//            if (Trim(StringGrid1.Cells[str_list.IndexOfName('提成比例'),i])<>'') or (Trim(StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i])<>'') then
//            begin
//              if (StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i]='') then StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i]:='0';
//              if (StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]='') then StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]:='0';
//              tmpAdo.Close;
//              tmpAdo.SQL.Text:='Insert into data0125 (Rkey10,Proportion,brokerage,Remark) Values(:Rkey10,:Proportion,:brokerage,:Remark)';
//              tmpAdo.Parameters.ParamByName('Rkey10').Value:=StringGrid1.Cells[str_list.IndexOfName('Rkey'),i];
//              tmpAdo.Parameters.ParamByName('Proportion').Value:=StringGrid1.Cells[str_list.IndexOfName('提成比例'),i];
//              tmpAdo.Parameters.ParamByName('brokerage').Value:=StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i];
//              tmpAdo.Parameters.ParamByName('Remark').Value:=StringGrid1.Cells[str_list.IndexOfName('备注'),i];
//              tmpAdo.ExecSQL;
//            end;
//          end;
//        end else
//        begin
//          for i :=1  to StringGrid1.RowCount-1 do
//          begin
//            if (Trim(StringGrid1.Cells[str_list.IndexOfName('提成比例'),i])<>'') or (Trim(StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i])<>'') then
//            begin
//              if (StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i]='') then StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i]:='0';
//              if (StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]='') then StringGrid1.Cells[str_list.IndexOfName('提成比例'),i]:='0';
//              tmpAdo.Close;
//              tmpAdo.SQL.Text:='Insert into data0125 (Rkey10,Proportion,brokerage,Remark) Values(:Rkey10,:Proportion,:brokerage,:Remark)';
//              tmpAdo.Parameters.ParamByName('Rkey10').Value:=StringGrid1.Cells[str_list.IndexOfName('Rkey'),i];
//              tmpAdo.Parameters.ParamByName('Proportion').Value:=StringGrid1.Cells[str_list.IndexOfName('提成比例'),i];
//              tmpAdo.Parameters.ParamByName('brokerage').Value:=StringGrid1.Cells[str_list.IndexOfName('佣金比例'),i];
//              tmpAdo.Parameters.ParamByName('Remark').Value:=StringGrid1.Cells[str_list.IndexOfName('备注'),i];
//              tmpAdo.ExecSQL;
//            end;
//          end;
//        end;
//        dm.ADOConnection1.CommitTrans;
//        Button1.Tag:=0;
//      except
//        dm.ADOConnection1.RollbackTrans;
//      end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

procedure TfrmSetClerk.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (ACol=6) or (ACol=7) or (ACol=8)then
    CanSelect:=True
  else
    CanSelect:=False;
  if (ACol=0) then
  begin
    Label1.Caption:=StringGrid1.Cells[0,0];
    Edit1.Tag:=0;
  end;
  if (ACol=1) then
  begin
    Label1.Caption:=StringGrid1.Cells[1,0];
    Edit1.Tag:=1;
  end;
  if (ACol=2) then
  begin
    Label1.Caption:=StringGrid1.Cells[2,0];
    Edit1.Tag:=2;
  end;
end;

procedure TfrmSetClerk.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (StringGrid1.Col=6) then
  begin
     if not (Key in ['0'.. '9','.',#8,#13]) then Key:=#0;
     if (key='.') and (Pos('.',StringGrid1.Cells[6,StringGrid1.Row])>0)  then
        key:=#0;
  end;
  if (StringGrid1.Col=7) then
  begin
     if not (Key in ['0'.. '9','.',#8,#13]) then Key:=#0;
     if (key='.') and (Pos('.',StringGrid1.Cells[7,StringGrid1.Row])>0)  then
        key:=#0;
  end;
end;

procedure TfrmSetClerk.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(dm.Ado10.SQL.Text);
end;

procedure TfrmSetClerk.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  DM.tmp.Close;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text:='update data0125 set iStatus=1 where Rkey10='+StringGrid1.Cells[str_list.IndexOfName('Rkey'),StringGrid1.Row];
  DM.tmp.ExecSQL;
  showSG;
end;

procedure TfrmSetClerk.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  DM.tmp.Close;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text:='update data0125 set iStatus=0 where Rkey10='+StringGrid1.Cells[str_list.IndexOfName('Rkey'),StringGrid1.Row];
  DM.tmp.ExecSQL;
  showSG;
end;

procedure TfrmSetClerk.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  DM.tmp.Close;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text:='update data0125 set iStatus=1';
  DM.tmp.ExecSQL;
  showSG;
end;

procedure TfrmSetClerk.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  DM.tmp.Close;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text:='update data0125 set iStatus=0';
  DM.tmp.ExecSQL;
  showSG;
end;

procedure TfrmSetClerk.BitBtn1Click(Sender: TObject);
begin
  Export_Grid_to_Excel(StringGrid1,Self.Caption);
end;

end.
