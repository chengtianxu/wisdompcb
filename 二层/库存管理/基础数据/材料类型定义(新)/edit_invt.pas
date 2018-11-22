unit edit_invt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, Menus,
  ExtCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SGrid1: TStringGrid;
    SGrid2: TStringGrid;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Edit2: TEdit;
    Label7: TLabel;
    Bevel1: TBevel;
    BitBtn4: TBitBtn;
    Label8: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    Edit3: TEdit;
    ComboBox3: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    Edit4: TEdit;
    BitBtn5: TBitBtn;
    DBCheckBox2: TDBCheckBox;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure SGrid1DblClick(Sender: TObject);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);

   
  private
    { Private declarations }
    v_close:byte;
  public
    { Public declarations }
    
  end;

var
  Form2: TForm2;

implementation
 uses damo, edit_ies, main, invgroup_search, AcctSearch,constvar,pick_item_single;
{$R *.dfm}

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
  end;
if sgrid1.RowCount=12 then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 case combobox1.ItemIndex of
  0:dm.ADO496ttype.Value:='P';
  1:dm.ADO496ttype.Value:='M';
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 dm.ADO496.Cancel;
 dm.ADO499.Close;
 dm.aq278.Close;
 v_close:=1; 
 close;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
begin
 i:=1;
 v_close:=0;
 sgrid1.cells[0,0]:='参数号';
 sgrid1.cells[1,0]:='参数名称';
 sgrid1.cells[2,0]:='参数描述';
 sgrid1.cells[3,0]:='默认值';
 sgrid1.cells[4,0]:='参数性质';
 dm.ADO499.Close;                    //在新增时同样打开
 dm.ADO499.Parameters[0].Value:=dm.ADO496RKEY.Value;
 dm.ADO499.Open;
 dm.aq278.Parameters[0].Value:=dm.ADO499PARAMETER_PTR.Value;
 dm.aq278.Open; //aq278与ado499静态连接
 sgrid1.RowCount:=dm.ADO499.RecordCount+2;
 sgrid2.RowCount:=dm.ADO499.RecordCount+2;
 while not dm.ADO499.Eof do
  begin
   sgrid1.Cells[0,i]:=dm.ADO499SEQ_NO.AsString;
   sgrid1.Cells[1,i]:=dm.aq278PARAMETER_NAME.AsString;
   sgrid1.Cells[2,i]:=dm.aq278PARAMETER_DESC.AsString;
   sgrid1.Cells[3,i]:=dm.ADO499DEF_VALUE.AsString;
   if dm.ADO499ttype.Value=0 then
    sgrid1.Cells[4,i]:='材料参数'
   else
    sgrid1.Cells[4,i]:='产品参数';
   sgrid2.Cells[0,i]:=dm.ADO499PARAMETER_PTR.AsString;
   sgrid2.Cells[1,i]:=dm.ADO499ttype.AsString;
   dm.ADO499.Next;
   inc(i);
  end;
 if dm.ADO496ttype.Value='P' then
  combobox1.ItemIndex:=0
 else
  if dm.ADO496ttype.Value='M' then
   combobox1.ItemIndex:=1;

 dm.ADOQuery1.Open;
 if not dm.ADOQuery1.IsEmpty then
  begin
   edit1.Text:=dm.ADOQuery1inv_group_name.Value;
   label5.Caption:=dm.ADOQuery1inv_group_desc.Value;
  end;
 dm.ADOQuery1.Close;

 dm.ADOQuery2.open;
 if not dm.ADOQuery2.IsEmpty then
  begin
   edit2.Text:=trim(dm.ADOQuery2GL_ACC_NUMBER.Value);

  if trim(dm.ADOQuery2GL_DESCRIPTION.Value)<>'' then
   label8.Caption:=trim(dm.ADOQuery2GL_DESCRIPTION.Value)+'-'+
                    trim(dm.ADOQuery2DESCRIPTION_2.Value)
  else
   label8.Caption:=trim(dm.ADOQuery2DESCRIPTION_2.Value);

  end;
 dm.ADOQuery2.Close;

end;

procedure TForm2.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;
begin
if button=mbright then
 begin
  sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
 end;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
 try                   //新增
  form3:=tform3.Create(application);
  form3.Label4.Caption:='0'; //标识为编辑
  if form3.ShowModal=mrok then
   begin
    sgrid1.Cells[0,sgrid1.RowCount-1]:=inttostr(sgrid1.RowCount-1);
    sgrid1.Cells[1,sgrid1.RowCount-1]:=form3.Edit1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=form3.Label1.Caption;
    sgrid1.Cells[3,sgrid1.RowCount-1]:=form3.Edit2.Text;
    sgrid1.Cells[4,sgrid1.RowCount-1]:=
        form3.RadioGroup1.Items[form3.RadioGroup1.itemindex];
    sgrid2.Cells[0,sgrid2.RowCount-1]:=form3.ies_rkey.Caption;
    sgrid2.Cells[1,sgrid2.RowCount-1]:=inttostr(form3.RadioGroup1.itemindex);
    sgrid1.RowCount:=sgrid1.RowCount+1;
    sgrid2.RowCount:=sgrid2.RowCount+1
   end;
 finally
  form3.free;
 end;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
 try       //编辑
  form3:=tform3.Create(application);
  with form3 do
   begin
    Label4.Caption:='1'; //标识为编辑
    edit1.Text:=sgrid1.Cells[1,sgrid1.row];
    edit1.Font.Color:=clwindowtext;
    label1.Caption:=sgrid1.Cells[2,sgrid1.row];
    edit2.Text:=sgrid1.Cells[3,sgrid1.row];
    ies_rkey.Caption:=sgrid2.Cells[0,sgrid1.row];
    radiogroup1.ItemIndex:=strtoint(sgrid2.Cells[1,sgrid1.row]);
   end;
  if form3.ShowModal=mrok then
   begin
    sgrid1.Cells[1,sgrid1.Row]:=form3.Edit1.Text;
    sgrid1.Cells[2,sgrid1.Row]:=form3.Label1.Caption;
    sgrid1.Cells[3,sgrid1.Row]:=form3.Edit2.Text;
    sgrid1.Cells[4,sgrid1.Row]:=
        form3.RadioGroup1.Items[form3.RadioGroup1.itemindex];
    sgrid2.Cells[0,sgrid1.Row]:=form3.ies_rkey.Caption;
    sgrid2.Cells[1,sgrid1.Row]:=inttostr(form3.RadioGroup1.itemindex);
   end;
 finally
  form3.Free;
 end;
end;

procedure TForm2.N3Click(Sender: TObject);
var
 i:byte;
 seq_no:string;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   seq_no:=sgrid1.Cells[0,i];
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
   if i<>sgrid1.RowCount-2 then  sgrid1.Cells[0,i]:=seq_no;
   sgrid2.Rows[i].Text:=sgrid2.Rows[i+1].Text;
  end;
 if sgrid1.RowCount>2 then
  begin
   sgrid1.RowCount:=sgrid1.RowCount-1;
   sgrid2.RowCount:=sgrid2.RowCount-1;
  end;   
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
 dm.ADOConnection1.BeginTrans;
 try
  if (ComboBox2.Text='是') then
   DM.ADO496.FieldByName('INSPECT').Value:='Y'
  else
   DM.ADO496.FieldByName('INSPECT').Value:='N';

  if (ComboBox3.Text='是') then
    DM.ADO496.FieldByName('CATALOG_NUM').Value:='Y'
  else
    DM.ADO496.FieldByName('CATALOG_NUM').Value:='N';

  if (ComboBox4.Text='是') then
   DM.ADO496.FieldByName('AVL_FLAG').Value:='Y'
  else
   DM.ADO496.FieldByName('AVL_FLAG').Value:='N';

  if (Trim(Edit3.Text)='') then
   Edit3.Text:='0';
   DM.ADO496.FieldByName('SHELF_LIFE').Value:=Trim(Edit3.Text);

  if Edit4.Text <> '' then
   DM.ADO496.FieldByName('Rkey595').Value:=edit4.Tag
  else
   DM.ADO496.FieldByName('Rkey595').Value:=null;

  dm.ADO496.Post;


 dm.ADO499.First;
 while not dm.ADO499.Eof do dm.ADO499.Delete;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   dm.ADO499.append;
   dm.ADO499INV_GROUP_PTR.Value:=dm.ADO496rkey.Value;
   dm.ADO499PARAMETER_PTR.Value:=strtoint(sgrid2.cells[0,i]);
   dm.ado499ttype.value:=strtoint(sgrid2.cells[1,i]);
   dm.ADO499SEQ_NO.AsString:=sgrid1.Cells[0,i];
   dm.ADO499DEF_VALUE.Value:=sgrid1.Cells[3,i];
   dm.ADO499.Post;
  end;
  dm.ADOConnection1.CommitTrans;
    v_close:=1;
  ModalResult:=mrok;

 except
  dm.ADOConnection1.RollbackTrans;
 end;

end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
 if trim(dbedit1.Text)='' then
  begin
   messagedlg('类别名称不能为空!',mtinformation,[mbok],0);
   dbedit1.SetFocus;
  end
 else
 if trim(edit1.Text)='' then
  begin
   messagedlg('组别名称不能为空!',mtinformation,[mbok],0);
   bitbtn3.SetFocus;
  end
 else
 if trim(ComboBox2.Text)='' then
  begin
   messagedlg('请选择是否检查!',mtinformation,[mbok],0);
   ComboBox2.SetFocus;
  end
 else
 if trim(Edit3.Text)='' then
  begin
   messagedlg('有效天数不能为空!',mtinformation,[mbok],0);
   Edit3.SetFocus;
  end
 else
  if trim(ComboBox3.Text)='' then
   begin
    messagedlg('请选择是否环保测试!',mtinformation,[mbok],0);
    ComboBox3.SetFocus;
   end
  else
   if trim(ComboBox4.Text)='' then
    begin
     messagedlg('请选择是否认可供应商!',mtinformation,[mbok],0);
     ComboBox4.SetFocus;
    end;
 if (dm.ADO496IF_FLAG.Value=3) and (Edit4.Text='') then
 begin
   messagedlg('编码按规则输入,请选择编码规则!',mtinformation,[mbok],0);
   BitBtn5.SetFocus;
 end;

end;


procedure TForm2.SGrid1DblClick(Sender: TObject);
begin
 if sgrid1.Row<>sgrid1.RowCount-1 then
  n2click(sender);
end;

procedure TForm2.SGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=VK_DELETE) and (ssCtrl in shift) then
   n3click(sender)
  else
   if (key=VK_insert) and (sgrid1.RowCount<12) then
    n1click(sender);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ADO499.Close;
 dm.aq278.Close;
 form1.show;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if  v_close=0 then
 dm.ADO496.Cancel;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
form4:=tform4.Create(application);
if form4.ShowModal=mrok then
 begin
  edit1.Text:=form4.aq0019inv_group_name.Value;
  label5.Caption:=form4.aq0019inv_group_desc.Value;
  dm.ADO496group_ptr.Value:=form4.aq0019rkey.Value;
 end;
form4.Free;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
form_acct:=tform_acct.Create(application);
if form_acct.ShowModal=mrok then
begin
 edit2.Text:=trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value);
 if trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)<>'' then
  label8.Caption:=trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                    trim(form_acct.ADOQuery1DESCRIPTION_2.Value)
 else
  label8.Caption:=trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
 dm.ADO496gl_acct_ptr.Value:=form_acct.ADOQuery1RKEY.Value;
end;
form_acct.Free;
end;





procedure TForm2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then
 key := #0;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    inputvar.Fields:='TYPE_CODE/材料编码/180,TYPE_NAME/材料名称/180';
    inputvar.Sqlstr:='SELECT * FROM DATA0595';
    inputvar.InPut_value:=edit4.Text;
    inputvar.KeyField:='TYPE_CODE';
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar); //初始化窗体
    if frmpick_item_single.ShowModal=mrok then
     begin
      edit4.Text:=trim(frmpick_item_single.adsPick.FieldValues['TYPE_CODE']);
      label14.Caption:=trim(frmpick_item_single.adsPick.FieldValues['TYPE_NAME']);
      edit4.Tag:=frmpick_item_single.adsPick.FieldValues['rkey']; //获得rkey的值
     end
    else
     edit4.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;



procedure TForm2.DBRadioGroup1Click(Sender: TObject);
begin
  if  DBRadioGroup1.ItemIndex =3 then
      BitBtn5.Enabled := True
  else
  begin
    BitBtn5.Enabled := False;
    Edit4.Text :='';
    Label14.Caption :='';
  end;
end;


end.
