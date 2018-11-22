unit IF_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids,DateUtils, ExtCtrls
  ;

type
  TIf_Form1 = class(TForm)
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    Label2: TLabel;
    BitBtn8: TBitBtn;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    RadioGroup2: TRadioGroup;
    lab_rkey15: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vparametersvalue1:string;
    vparametersvalue2:string;
    vparametersvalue3:string;
    vparametersvalue4:string;
    vparametersvalue5:string;
    vparametersvalue6:string;
    vparametersvalue7:string;
    procedure update2_sgrid(sgrid_row:integer);
    procedure update_sgrid();
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
  If_Form1: TIf_Form1;

implementation


uses
   DAMO
   ,Pick_Item_Single
   ,ConstVar;

{uses

   find_CUSTOMER_PART_DESC_Unit2
   ,find_CUSTOMER_PART_NUMBER_Unit2
   , findUnit1,Unit4
   ,Unit5 ; {}

{$R *.dfm}

procedure TIf_Form1.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TIf_Form1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
     sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TIf_Form1.BitBtn6Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TIf_Form1.BitBtn3Click(Sender: TObject);
var
 i:integer;
 n1,n2,n0,n3,n4,n5,n6,n7:integer;
begin
  {if sgrid1.RowCount=2 then
      if MessageDlg('没有定义查询条件，是否要定义查询条件?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          exit;
        end;
  {}
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
  n0:=length(trim(sgrid1.Cells[2,i]));
  n1:=length(vparametersvalue1);
  if n1+n0<99
  then
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
  modalresult:=mrok;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 //只允许删除倒数第一行之前的行
 if sgrid1.Row=sgrid1.RowCount-1 then
     bitbtn4.Enabled:=false
 else
     bitbtn4.Enabled:=true;
end;

procedure TIf_Form1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
begin
 case listbox2.ItemIndex of
     0:begin //请购编号
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and data0068.PO_REQ_NUMBER  LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     1:begin  //请购部门
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and dbo.Data0034.DEPT_NAME LIKE ''%'+trim(edit2.Text)+'%''';
       end;                            
     2:begin   //请购人员
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and Data0005.EMPLOYEE_NAME LIKE ''%'+trim(edit2.Text)+'%''';
       end;
 end;
end;


procedure TIf_Form1.update_sgrid;
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

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
begin
    if Trim(Edit2.Text)='' then Exit;
  update_sgrid; //新增内容
end;

procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin
  label2.Visible := false;
  label2.Caption:=' '+listbox2.Items[listbox2.itemindex]+':  ';

  edit2.Text:='';
  edit2.Visible:=false;
  edit2.ReadOnly:=false;
  bitbtn7.Visible:=false;
//  bitbtn8.Enabled:=false;

  case listbox2.ItemIndex of
      0:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              BitBtn7.Visible :=false;
          end;
      1:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              BitBtn7.Visible :=true;
          end;
      2:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              BitBtn7.Visible :=true;
          end;
  end;
end;

procedure TIf_Form1.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  //dtpk3.Date:=EncodeDate(YearOf(now()),MonthOf(now()),1);
  //dtpk4.Date:=now();
  //DateTimePicker1.Date :=dtpk3.Date;
  //DateTimePicker2.Date :=dtpk4.Date;
  //EncodeDate(YearOf(now()),MonthOf(now()),1)
  vparametersvalue1:='';
  vparametersvalue2:='';
  vparametersvalue3:='';
  vparametersvalue4:='';
  vparametersvalue5:='';
  vparametersvalue6:='';
  vparametersvalue7:='';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);
end;

function TIf_Form1.Get_parametersvalue1: string;
begin
  result:=vparametersvalue1;
end;

function TIf_Form1.Get_parametersvalue2: string;
begin
  result:=vparametersvalue2;
end;

function TIf_Form1.Get_parametersvalue3: string;
begin
  result:=vparametersvalue3;
end;

function TIf_Form1.Get_parametersvalue4: string;
begin
  result:=vparametersvalue4;
end;

function TIf_Form1.Get_parametersvalue5: string;
begin
  result:=vparametersvalue5;
end;

function TIf_Form1.Get_parametersvalue6: string;
begin
  result:=vparametersvalue6;
end;

function TIf_Form1.Get_parametersvalue7: string;
begin
  result:=vparametersvalue7;
end;

procedure TIf_Form1.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin

  if ListBox2.ItemIndex=1 then
  begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'DEPT_CODE/部门代码/60,DEPT_NAME/部门名称/350';
    InputVar.Sqlstr := 'SELECT DEPT_CODE, DEPT_NAME FROM dbo.Data0034';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit2.Text:=frmPick_Item_Single.adsPick.FieldValues['DEPT_NAME'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
 case listbox2.ItemIndex of
  2:
  begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'empl_CODE/员工代码/60,employee_NAME/员工姓名/200,abbr_name/姓名简称/150';
    InputVar.Sqlstr := 'select RKEY,empl_CODE,employee_NAME,abbr_name from data0005 '+
                    'order by empl_CODE';
    inputvar.KeyField:='empl_CODE';
    inputvar.InPut_value:=edit2.Text;
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit2.Text := frmPick_Item_Single.adsPick.FieldValues['employee_NAME'];
      lab_rkey15.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
      BitBtn8.Enabled := true ;
      bitbtn8.SetFocus;
     end
    else
    edit2.SetFocus;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
 end;
end;

procedure TIf_Form1.FormCreate(Sender: TObject);
begin
  self.Position := poScreenCenter;
end;

end.
