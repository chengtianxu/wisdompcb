unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Grids, Buttons, ComCtrls;

type
  TfrmQry = class(TForm)
    pnl1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    dtpk4: TDateTimePicker;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    dtpk3: TDateTimePicker;
    BitBtn8: TBitBtn;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    procedure ListBox2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);

  private
    { Private declarations }
    vparametersvalue1:string;
    vparametersvalue2:string;
    vparametersvalue3:string;
    vparametersvalue4:string;
    vparametersvalue5:string;
    vparametersvalue6:string;
    vparametersvalue7:string;
    procedure update_sgrid();
    procedure update2_sgrid(sgrid_row: integer);
    function Get_parametersvalue1: string;
    function Get_parametersvalue2: string;
    function Get_parametersvalue3: string;
    function Get_parametersvalue4: string;
    function Get_parametersvalue5: string;
    function Get_parametersvalue6: string;
    function Get_parametersvalue7: string;
  public
    { Public declarations }
    property parametersvalue1:string read Get_parametersvalue1;
    property parametersvalue2:string read Get_parametersvalue2;
    property parametersvalue3:string read Get_parametersvalue3;
    property parametersvalue4:string read Get_parametersvalue4;
    property parametersvalue5:string read Get_parametersvalue5;
    property parametersvalue6:string read Get_parametersvalue6;
    property parametersvalue7:string read Get_parametersvalue7;
  end;

var
  frmQry: TfrmQry;

implementation
    uses  Pick_Item_Single,ConstVar, UDM;
{$R *.dfm}



procedure TfrmQry.ListBox2Click(Sender: TObject);
begin
  label2.Visible := false;
  label2.Caption:=' '+listbox2.Items[listbox2.itemindex]+':  ';
  label6.Visible:=false;
  label7.Visible:=false;
  dtpk3.Visible:=false;
  dtpk4.Visible:=false;
  edit2.Text:='';
  edit2.Visible:=false;
  bitbtn7.Visible:=false;
  bitbtn8.Enabled:=false;
  edit1.Visible :=false;
  Label1.Visible :=false;
  CheckBox1.Visible := false;
  ComboBox1.Visible := false;

  case listbox2.ItemIndex of
      0,1,5:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              BitBtn7.Visible :=true;
          end;

      2,3:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              //BitBtn8.Enabled := true;
          end;
      4:
          begin
              ComboBox1.Visible := true;
              BitBtn8.Enabled :=true;
          end;
    end;
end;

procedure TfrmQry.BitBtn8Click(Sender: TObject);
begin
 update_sgrid; //新增内容
end;

procedure TfrmQry.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
     if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
        (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
         begin
             update2_sgrid(i);
             exit;
         end;
  //更新0列记录
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TfrmQry.update2_sgrid(sgrid_row: integer);
var
  a:integer;
begin
 case listbox2.ItemIndex of
     0:begin
          sgrid1.Cells[1,sgrid_row] := edit2.Text;
          sgrid1.Cells[2,sgrid_row] := ' and Data0025.MANU_PART_NUMBER LIKE '+'''%'+ trim(edit2.Text)+'%''';
         // ShowMessage(sgrid1.Cells[2,sgrid_row]);
         // a:=1;
       end;                            
     1:begin
          sgrid1.Cells[1,sgrid_row] := edit2.Text;
          sgrid1.Cells[2,sgrid_row] := ' and Data0025.MANU_PART_DESC LIKE '+'''%'+ trim(edit2.Text)+'%''';
       end;
     2:begin
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and data0101.LOG_NUMBER LIKE '+'''%'+ trim(edit2.Text)+'%''';

       end;
     3:begin
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE LIKE '+'''%'+ trim(edit2.Text)+'%''';
       end;
     4:begin

          sgrid1.Cells[1,sgrid_row] := ComboBox1.Text ;
          sgrid1.Cells[2,sgrid_row] := 'and data0101.STATUS = ' + inttostr(ComboBox1.ItemIndex);

       end;
     5:begin   //责任部门
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and derivedtb.dept_names LIKE '+'''%'+trim(edit2.Text)+'%''';
       end;
     {6:begin   //状态
          //  RadioGroup1.Items[]
          sgrid1.Cells[1,sgrid_row]:= RadioGroup1.Items[RadioGroup1.ItemIndex];
          sgrid1.Cells[2,sgrid_row]:='and data0025.TSTATUS = '+inttostr(RadioGroup1.ItemIndex);
       end; {}
      6:begin   //创建人
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and Data0005.EMPLOYEE_NAME LIKE '+'''%'+trim(edit2.Text)+'%''';
       end;

     end;

end;
 

procedure TfrmQry.BitBtn3Click(Sender: TObject);
var
 i:integer;
 n1,n2,n0,n3,n4,n5,n6,n7:integer;
begin

  hide;
  vparametersvalue1:='';
  vparametersvalue2:='';
  vparametersvalue3:='';
  vparametersvalue4:='';
  vparametersvalue5:='';
  vparametersvalue6:='';
  vparametersvalue7:='';
  for i:=1 to sgrid1.RowCount-2  do
  begin
    //showmessage(sgrid1.Cells[2,i]);
    n0:=length(trim(sgrid1.Cells[2,i]));
    n1:=length(vparametersvalue1);
    if n1+n0<99 then
    begin
      vparametersvalue1:=vparametersvalue1+' '+trim(sgrid1.Cells[2,i]);
    end
    else
    begin
      n2:=length(vparametersvalue2);
      if n2+n0<99 then
      begin
         vparametersvalue2:=vparametersvalue2+' '+trim(sgrid1.Cells[2,i]);
      end
      else
      begin
        n3:=length(vparametersvalue3);
        if n3+n0<99 then
        begin
           vparametersvalue3:=vparametersvalue3+' '+trim(sgrid1.Cells[2,i]);
        end
        else
        begin
          n4:=length(vparametersvalue4);
          if n4+n0<99 then
          begin
             vparametersvalue4:=vparametersvalue4+' '+trim(sgrid1.Cells[2,i]);
          end
          else
          begin
            n5:=length(vparametersvalue5);
            if n5+n0<99 then
            begin
               vparametersvalue5:=vparametersvalue5+' '+trim(sgrid1.Cells[2,i]);
            end
            else
            begin
              n6:=length(vparametersvalue6);
              if n6+n0<99 then
              begin
                 vparametersvalue6:=vparametersvalue6+' '+trim(sgrid1.Cells[2,i]);
              end
              else
              begin
                n7:=length(vparametersvalue7);
                if n7+n0<99 then
                begin
                   vparametersvalue7:=vparametersvalue7+' '+trim(sgrid1.Cells[2,i]);
                end
                else
                begin
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  //showmessage(v1+' '+v2);

  modalresult:=mrok;
end;

procedure TfrmQry.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
     sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQry.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TfrmQry.BitBtn6Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TfrmQry.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
end;

procedure TfrmQry.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0] := '条件名';
  sgrid1.Cells[1,0] := '条件值';

  
  vparametersvalue1 := '';
  vparametersvalue2 := '';
  vparametersvalue3 := '';
  vparametersvalue4 := '';
  vparametersvalue5 := '';
  vparametersvalue6 := '';
  vparametersvalue7 := '';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);
end;

procedure TfrmQry.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 //只允许删除倒数第一行之前的行
 if sgrid1.Row=sgrid1.RowCount-1 then
     bitbtn4.Enabled:=false
 else
     bitbtn4.Enabled:=true;
end;

procedure TfrmQry.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
  if button=mbright then
      begin
          SGrid1.MouseToCell(x,y,column,row);
          if (row>0) and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
      end;
end;

procedure TfrmQry.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit2.Text)<>'' then
      bitbtn8.Enabled:=true
  else
      bitbtn8.Enabled:=false;
end;

procedure TfrmQry.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  case listbox2.ItemIndex of
      0,1,5:
         begin
              frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
              try
                  if listbox2.ItemIndex = 0 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 600;
                          InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/400';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,MANU_PART_NUMBER from data0025 where PARENT_PTR = 0 or PARENT_PTR is null';
                          //InputVar.InPut_value
                      end
                  else if listbox2.ItemIndex = 1 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 600;
                          InputVar.Fields := 'MANU_PART_DESC/客户型号/400';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,MANU_PART_DESC from data0025 where (PARENT_PTR = 0 or PARENT_PTR is null) and MANU_PART_DESC <> ''''';
                          //InputVar.InPut_value
                      end
                  else if listbox2.ItemIndex = 2 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 600;
                          InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/400';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select DISTINCT rkey,WORK_ORDER_NUMBER from data0006';
                          //InputVar.InPut_value
                      end
                  else if listbox2.ItemIndex = 3 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 800;
                          InputVar.Fields := 'MANU_PART_NUMBER/部件编号/400';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,MANU_PART_NUMBER from data0025';
                          //InputVar.InPut_value
                      end
                  else if listbox2.ItemIndex = 5 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 800;
                          InputVar.Fields := 'DEPT_Name/部门名称/400';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,dept_name from data0034';
                          //InputVar.InPut_value
                      end;
                  InputVar.AdoConn := DM.con1 ;
                  frmPick_Item_Single.InitForm_New(InputVar)  ;
                  if frmPick_Item_Single.ShowModal=mrok then
                       begin
                            if listbox2.ItemIndex = 0 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
                            else if listbox2.ItemIndex = 1 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']
                            else if listbox2.ItemIndex = 2 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['WORK_ORDER_NUMBER']
                            else if listbox2.ItemIndex = 3 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
                            else if listbox2.ItemIndex = 5 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['dept_name']
                            ;

                            if edit2.Text <>'' then
                                BitBtn8.Enabled := true ;
                       end;
              finally
                  frmPick_Item_Single.adsPick.Close;
                  frmPick_Item_Single.Free ;
              end;
         end;

      end;
end;

function TfrmQry.Get_parametersvalue1: string;
begin
   result:=vparametersvalue1;
end;

function TfrmQry.Get_parametersvalue2: string;
begin
   result:=vparametersvalue2;
end;

function TfrmQry.Get_parametersvalue3: string;
begin
  result:=vparametersvalue3;
end;

function TfrmQry.Get_parametersvalue4: string;
begin
  result:=vparametersvalue4;
end;

function TfrmQry.Get_parametersvalue5: string;
begin
  result:=vparametersvalue5;
end;

function TfrmQry.Get_parametersvalue6: string;
begin
result:=vparametersvalue6;
end;

function TfrmQry.Get_parametersvalue7: string;
begin
 result:=vparametersvalue7;
end;

end.
