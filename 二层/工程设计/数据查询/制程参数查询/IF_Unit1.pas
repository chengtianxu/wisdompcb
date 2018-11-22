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
    BitBtn8: TBitBtn;
    Label3: TLabel;
    RadioGroup2: TRadioGroup;
    Label2: TLabel;
    Bevel1: TBevel;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    dtpk1: TDateTimePicker;
    Label4: TLabel;
    ComboBox2: TComboBox;
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
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
   DMUnit1
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
  if sgrid1.RowCount = 2 then
      begin
          showmessage('请选择条件');
          exit;
      end;

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
     0:begin //本厂编号
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_NUMBER LIKE '''+trim(edit2.Text)+'%''' ;
       end;
     1:begin  //客户型号
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_DESC LIKE ''%'+trim(edit2.Text)+'%''';
       end;                            //Data0017.
     2:begin  //客户代码
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and data0010.CUST_CODE = '''+trim(edit2.Text)+'''';
       end;                             // Data0076.
     3:begin  //工序代码
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and Data0034.DEPT_CODE = '''+trim(edit2.Text)+'''';
       end;
     4:begin  //参数代码
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and Data0278.PARAMETER_NAME = '''+trim(edit2.Text)+'''';
       end;
     5:begin   //参数值
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:='and Data0494.PARAMETER_VALUE LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     {6:begin   //
          //  RadioGroup1.Items[]
          sgrid1.Cells[1,sgrid_row]:= RadioGroup1.Items[RadioGroup1.ItemIndex];
          sgrid1.Cells[2,sgrid_row]:='and data0025.TSTATUS = '+inttostr(RadioGroup1.ItemIndex);
       end;  {}


     end;

end;

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
begin
  update_sgrid; //新增内容
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

procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin
  label2.Visible := false;
  label2.Caption:=' '+listbox2.Items[listbox2.itemindex]+':  ';
  edit2.Text:='';
  edit2.Visible:=false;
  bitbtn7.Visible:=false;
  bitbtn8.Enabled:=false;
  //RadioGroup1.Visible := false;

  case listbox2.ItemIndex of
      0:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              BitBtn7.Visible :=true;
          end;
      1:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              //BitBtn7.Visible :=true;
          end;
      2,3,4:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              BitBtn7.Visible :=true;
          end;
      5:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              //BitBtn7.Visible :=true;
          end;
      {6:
          begin
              RadioGroup1.Visible := true;
              BitBtn8.Enabled := true;
          end; {}
      6:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              //BitBtn7.Visible :=true;
          end;
      7:
          begin
              label2.Visible := true;
              edit2.Visible := true;
              //BitBtn7.Visible :=true;
          end;
    {4:
        begin
           Label2.Visible := false;
           Label6.Visible :=true;
           Label7.Visible :=true;
           dtpk3.Visible :=true;
           dtpk4.Visible :=true;
           BitBtn8.Enabled :=true;
           edit2.Visible := false;
        end;  }
    end;
end;

procedure TIf_Form1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit2.Text)<>'' then
      bitbtn8.Enabled:=true
  else
      bitbtn8.Enabled:=false;
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
  case listbox2.ItemIndex of
      0,2,3,4:
         begin
              frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
              try
                  if listbox2.ItemIndex=0 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 600;
                          InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/400';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,MANU_PART_NUMBER from data0025';
                          //InputVar.InPut_value
                      end
                  else if listbox2.ItemIndex = 2 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 800;
                          InputVar.Fields := 'CUST_CODE/客户代码/100,ABBR_NAME/客户简称/100,CUSTOMER_NAME/客户名称/200';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,CUST_CODE,ABBR_NAME,CUSTOMER_NAME from data0010';
                          //InputVar.InPut_value
                      end
                  else if listbox2.ItemIndex = 3 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 800;
                          InputVar.Fields := 'DEPT_CODE/工序代码/100,DEPT_NAME/工序名称/200';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,DEPT_CODE,DEPT_NAME from data0034 where ttype =1';
                          //InputVar.InPut_value
                      end
                  else if listbox2.ItemIndex = 4 then
                      begin
                          //frmPick_Item_Single.Height := 600;
                          //frmPick_Item_Single.Width := 800;
                          InputVar.Fields := 'PARAMETER_NAME/参数代码/100,PARAMETER_DESC/参数名称/200';
                          //InputVar.KeyField
                          InputVar.Sqlstr := 'select RKEY,PARAMETER_NAME,PARAMETER_DESC  from data0278';
                          //InputVar.InPut_value
                      end;

                  InputVar.AdoConn := DM.ADOConnection1 ;
                  frmPick_Item_Single.InitForm_New(InputVar)  ;
                  if frmPick_Item_Single.ShowModal=mrok then
                       begin
                            if listbox2.ItemIndex=0 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
                            else if listbox2.ItemIndex=2 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']
                            else if listbox2.ItemIndex=3 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']
                            else if listbox2.ItemIndex=4 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['PARAMETER_NAME'];

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

procedure TIf_Form1.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
end;

end.
