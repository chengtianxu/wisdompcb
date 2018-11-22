unit Uqry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ComCtrls, Buttons, ExtCtrls,ConstVar;


type
  TFrmQry = class(TForm)
    Label3: TLabel;
    GroupBox6: TGroupBox;
    lbl_field: TLabel;
    rg_sign: TRadioGroup;
    rg_condi: TRadioGroup;
    rg_yesno: TRadioGroup;
    edt_Value: TEdit;
    btn_add: TButton;
    lst_fields: TListBox;
    StaticText7: TStaticText;
    btn_del: TButton;
    cbb_YM: TComboBox;
    btn_qry: TBitBtn;
    StaticText2: TStaticText;
    sg1: TStringGrid;
    btn_OK: TButton;
    btn_cancel: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cbb_type: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure lst_fieldsClick(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure rg_signClick(Sender: TObject);
  private
    { Private declarations }
     v_Field_List_CN,v_Field_List_EN:Variant;
    procedure  updateSG(sgrid_row: integer);

  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation

uses  udm,common,Pick_Item_Single;

{$R *.dfm}


procedure TFrmQry.FormShow(Sender: TObject);
var i:integer;
ssql: string;
begin

 try
 lst_fields.Items.Clear;
  v_Field_List_CN := VarArrayOf(['工号',
  '姓名','部门','年月','类型',  '状态']);
  v_Field_List_EN := VarArrayOf(['b.employeecode',
  'b.chineseName', 'c.departmentName','a.yearmonth','a.atype', 'a.status']);


  for i:= VarArrayLowBound(v_Field_List_CN,1)
  to VarArrayHighBound(v_Field_List_CN,1) do
    lst_fields.Items.Add(v_Field_List_CN[i]);
  sg1.Cells[0,0]:='条件名';
  sg1.Cells[1,0]:='条件值';
  lst_fields.ItemIndex := 0;

       //年月
       ssql:='select checkyearmonth  from  salarycheck  order by  checkyearmonth desc ';
     dm.OpenQry(dm.qry_temp,ssql);
     cbb_YM.Clear;

     if not dm.qry_temp.IsEmpty then
     with dm.qry_temp do
     begin
         first;
        while not eof do
        begin
        cbb_YM.Items.Add(fieldbyname('checkyearmonth').AsString);
        Next;
        end;
     end;

   edt_value.visible:=true;
   btn_qry.Visible:=True;
   rg_condi.Visible:=true;



   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;




end;

procedure TFrmQry.btn_qryClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
    try

   frmpick_item_single:=Tfrmpick_item_single.Create(application);

    case lst_fields.ItemIndex  of

    2://部门
     begin
      InputVar.Fields := 'departmentname/部门/400';
      InputVar.Sqlstr := ' select  rkey,departmentname, dbo.get_departments(rkey)as departmentstring  from datadepartment';
      inputvar.KeyField:='departmentname';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edt_Value.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
        edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
        label3.Caption := frmPick_Item_Single.adsPick.FieldValues['departmentstring'];   //该部门的所有下属部门
      end;
     end;

    1: //姓名:
      begin
      InputVar.Fields := 'chineseName/姓名/200,employeecode/工号/200';
      InputVar.Sqlstr :='select rkey,  employeecode,chineseName    from employeemsg ';
      inputvar.KeyField:='chineseName';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin

        edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['chineseName'];
          edt_Value.Tag :=  frmPick_Item_Single.adsPick.FieldValues['rkey'];
      end;
      end;

      0: //工号:
      begin
      InputVar.Fields := 'chineseName/姓名/200,employeecode/工号/200';
      InputVar.Sqlstr :='select rkey,  employeecode,chineseName    from employeemsg ';
      inputvar.KeyField:='employeecode';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edt_Value.Tag :=  frmPick_Item_Single.adsPick.FieldValues['rkey'];
        edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['employeecode'];
        edt_Value.Tag :=  frmPick_Item_Single.adsPick.FieldValues['rkey'];
      end;
      end;


   end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrmQry.lst_fieldsClick(Sender: TObject);
begin
  lbl_field.Caption:=' '+lst_fields.Items[lst_fields.itemindex]+':  ';
  edt_Value.Text:='';

  edt_Value.Visible := false;
  btn_qry.Visible := False;
  cbb_YM.Visible := False;
  cbb_type.Visible := False;

  rg_sign.Visible := False;
  rg_condi.Visible := False;
  rg_yesno.Visible := False;


  if lst_fields.ItemIndex in  [0,1,2] then    //部门 、工号、姓名
  begin
      btn_qry.Visible:=True;
      edt_Value.Visible:=true;
      rg_condi.Visible:=true;
  end;
    
  if lst_fields.ItemIndex =3 then
  begin
    cbb_YM.Visible := true;
  end;
  if lst_fields.ItemIndex=4 then
  begin
   cbb_type.Visible := true;
  end;
  if lst_fields.ItemIndex=5 then
  begin
   rg_yesno.Visible:=true;
  end;


end;

procedure TFrmQry.btn_delClick(Sender: TObject);
var i :integer;
begin
 
 for i:=1 to sg1.RowCount-2 do
 sg1.Rows[i].Clear;
 sg1.RowCount:=2;

end;

procedure TFrmQry.btn_cancelClick(Sender: TObject);
begin
close;
end;

procedure TFrmQry.btn_addClick(Sender: TObject);
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sg1.RowCount-2 do
     if (sg1.Cells[0,i]=lst_fields.Items[lst_fields.ItemIndex]) and
        (sg1.Cells[1,i]<>lst_fields.Items[lst_fields.ItemIndex]) then
         begin
             updateSG(i);
             exit;
         end;
  //更新0列记录
  sg1.Cells[0,sg1.RowCount-1]:=lst_fields.Items[lst_fields.itemindex];
  updateSG(sg1.RowCount-1);
  //增加一行空的记录
  sg1.RowCount :=sg1.RowCount +1;

end;

procedure  TFrmQry.updateSG(sgrid_row: integer);
begin
  sg1.Cells[0,sgrid_row]:=lst_fields.Items[lst_fields.itemindex];
  case lst_fields.ItemIndex of
 4:    //类型
  begin
    sg1.Cells[1,sgrid_row]:=trim(cbb_TYPE.Text);
    sg1.Cells[2,sgrid_row]:='and A.atype = '+inttostr(cbb_type.itemindex)+' ';
     
   end;

  3:    //年月
  begin
    sg1.Cells[1,sgrid_row]:=trim(cbb_YM.Text);
    sg1.Cells[2,sgrid_row]:='and a.yearmonth = '''+trim(cbb_YM.Text)+'''';

   end;

 2:   //部门
  begin
        sg1.Cells[1,sgrid_row]:=trim(edt_Value.Text);
        case rg_condi.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and departmentid = '''+inttostr(edt_Value.tag)+'''';
        1:sg1.Cells[2,sgrid_row]:='and departmentid in '+label3.Caption;
        end;
  end;
  0:  //工号
  begin
        sg1.Cells[1,sgrid_row]:=trim(edt_Value.Text);
        case rg_condi.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and b.employeecode = '''+edt_Value.Text+'''';
        1:sg1.Cells[2,sgrid_row]:='and b.employeecode like ''%'+edt_Value.Text+'%''';
        end;
    end;
 1:  //姓名
  begin
        sg1.Cells[1,sgrid_row]:=trim(edt_Value.Text);
        case rg_condi.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and b.chinesename = '''+edt_Value.Text+'''';
        1:sg1.Cells[2,sgrid_row]:='and b.chinesename like ''%'+edt_Value.Text+'%''';
        end;
    end;
 5: //是否审核
 begin
          sg1.Cells[1,sgrid_row]:= rg_yesno.Items[rg_yesno.ItemIndex];
        case rg_yesno.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and a.status = 0 ';
        1:sg1.Cells[2,sgrid_row]:='and a.status = 1 ';
    end;

 end;  //end case
end;
end;

procedure TFrmQry.rg_signClick(Sender: TObject);
begin
//   case rg_sign.ItemIndex of
//0,1,2:
//  begin
//   dtp1.Visible := false;
//   dtp2.Visible := false;
//   lbl_f.Visible := false;
//   lbl_t.Visible := false;
//  end;
//3:
//  begin
//  dtp1.Visible := true;
//   dtp2.Visible := true;
//   lbl_f.Visible := true;
//   lbl_t.Visible := true;
//   dtp_f.Visible:=False;
//  end;
//end;
end;

end.
