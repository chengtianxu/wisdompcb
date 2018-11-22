unit Frm_New_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, DB,adodb;
type
  TFrm_New = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BtnOk: TButton;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MaskEdit1: TMaskEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    StringGrid1: TStringGrid;
    ctype: TLabel;
    Label12: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    ComboBox15: TComboBox;
    ComboBox16: TComboBox;
    ComboBox17: TComboBox;
    ComboBox18: TComboBox;
    ComboBox19: TComboBox;
    ComboBox20: TComboBox;
    procedure BtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function mask_value(inv_number:string):string;
    function Power(x, y : extended) : extended;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure ComboBox6Exit(Sender: TObject);
    procedure ComboBox7Exit(Sender: TObject);
    procedure ComboBox8Exit(Sender: TObject);
    procedure ComboBox9Exit(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
  
  private
    inspect : string;
    shelf_life : Integer;
    catalog_num : string;
    avl_flag : string;
    strSGTxt:string;
    strType595:string;
    function svValid:boolean;
    procedure dbbox_additem(i,rkey278:integer);
    procedure dbbox_visible;
    procedure init(rkey496:integer);
    procedure init2(rkey595:string);
  public
    Rkey595:string;
    if_flag:Integer;
    Item593:string; //搜层593指针
    FEdtState:string;
    procedure Additem(Asql:string; ccb: TComboBox; ccb2: TComboBox);  //
    function GetCbbItem(ccb:TComboBox):string; //取后值
    function GetCbbItemText(ccb:TComboBox):string;//取前值
  end;
//  type
//    TMycbb = class(Tobject)
//    public
//      procedure Additem(Asql:string; ccb: TComboBox);  //ss必须是传地址参数
//  end;

var
  Frm_New: TFrm_New;

implementation
uses  common,damo, invtype_search, Unit_search, Frm_detail_u;
{$R *.dfm}

function TFrm_New.GetCbbItemText(ccb:TComboBox):string;//取前值
var itmp:Integer;
    strtmp:string;
begin
  Result:='';
  itmp:=Pos('(',ccb.Text);
  strtmp:=Copy(ccb.Text,1,itmp-1);
  Result:=strtmp;
end;

function TFrm_New.GetCbbItem(ccb:TComboBox):string; //取后值
var itmp,itmp2:Integer;
    strtmp:string;
begin
  Result:='';
  itmp:=Pos('(',ccb.Text);
  itmp2:=Pos(')',ccb.Text);
  strtmp:=Copy(ccb.Text,itmp+1,itmp2-itmp-1);
  Result:=strtmp;
end;

procedure TFrm_New.Additem(Asql:string; ccb: TComboBox; ccb2: TComboBox);
var i:Integer;
    tmpa:TADOQuery;
    ls:TStringList;
begin
  ccb.items.clear();
  ccb2.items.clear();
  tmpa:= TADOQuery.Create(nil);
  ls:=TStringList.Create;
  ls.Clear;
  try
    tmpa.Connection:= DM.ADOConnection1;
    tmpa.close();
    tmpa.SQL.Text :=Asql;
    tmpa.open();
    if not tmpa.IsEmpty then
    begin
      tmpa.First;
      while not tmpa.Eof do
      begin
        ccb.Items.Add(tmpa.fieldBYName('type_Name').AsString);
        ccb2.Items.Add(tmpa.fieldBYName('type_code').AsString);
        tmpa.Next();
      end;
    end;
  finally
    tmpa.Free;
    ls.Free;
  end;
end;

procedure TFrm_New.BtnOkClick(Sender: TObject);
var i,k:Integer;
begin
  if not svValid then abort;
 try
//2018-8-3tang添
   k:=1;
   if ((if_flag=3) and (Rkey595<>'')) then
   begin
      for i := 1 to ControlCount-1 do
      begin
        if (Controls[i].Tag>=11) and (Controls[i].Tag<=20) then
        begin
          if ((TComboBox(Controls[i]).Text)='') and (k<StringGrid1.RowCount-1) then
          begin
            ShowMessage('该材料是规则输入方式，请确定规则完整！');
            exit;
          end;
          k:=k+1;
        end;
      end;
   end;
//end 2018-8-3
    dm.ADOConnection1.BeginTrans;
    if dm.AQ17.Filter <> '' then dm.AQ17.Filtered:=false;
    dm.AQ17.Append;

    dm.AQ17CRITICAL_MATL_FLAG.Value :=0;  //重要材料
    dm.AQ17STOP_PURCH.Value := 'N';       //停止采购黩为为N
    dm.AQ17AVL_FLAG.Value := 'N';         //材料需要认可供应商
    dm.AQ17AUTO_PURCHASE_FLAG.Value :=0;  //自动采购
    dm.AQ17INSPECT.Value := 'N';          //检查
    dm.AQ17MIX_PARTS.Value := 'N';        //允许混合部件
    if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
      dm.AQ17STOCK_PURCH.Value :=1
    else
      dm.AQ17STOCK_PURCH.Value :=0;

    dm.AQ17GROUP_PTR.Value:=edit1.Tag;
    dm.AQ17PURCH_UNIT_PTR.Value:=edit3.Tag;
    dm.AQ17STOCK_UNIT_PTR.Value:=edit2.Tag;
    if ((if_flag=3) and (Rkey595<>'')) then
      dm.AQ17INV_PART_NUMBER.Value:=strType595+maskedit1.Text
    else
      dm.AQ17INV_PART_NUMBER.Value:=maskedit1.Text;
    dm.AQ17INV_NAME.Value:=Edit5.Text;
    dm.AQ17INV_DESCRIPTION.Value:=edit4.Text;

//2018-8-3tang添
    if ((if_flag=3) and (Rkey595<>'')) then
    begin
      if (Trim(ComboBox1.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE1.Value:=ComboBox1.Text;
      if (Trim(ComboBox2.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE2.Value:=ComboBox2.Text;
      if (Trim(ComboBox3.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE3.Value:=ComboBox3.Text;
      if (Trim(ComboBox4.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE4.Value:=ComboBox4.Text;
      if (Trim(ComboBox5.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE5.Value:=ComboBox5.Text;
      if (Trim(ComboBox6.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE6.Value:=ComboBox6.Text;
      if (Trim(ComboBox7.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE7.Value:=ComboBox7.Text;
      if (Trim(ComboBox8.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE8.Value:=ComboBox8.Text;
      if (Trim(ComboBox9.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE9.Value:=ComboBox9.Text;
      if (Trim(ComboBox10.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE10.Value:=ComboBox10.Text;
    end else
    begin
      dm.AQ17IES_PARAMETER_VALUE1.Value:=ComboBox1.Text;
      dm.AQ17IES_PARAMETER_VALUE2.Value:=ComboBox2.Text;
      dm.AQ17IES_PARAMETER_VALUE3.Value:=ComboBox3.Text;
      dm.AQ17IES_PARAMETER_VALUE4.Value:=ComboBox4.Text;
      dm.AQ17IES_PARAMETER_VALUE5.Value:=ComboBox5.Text;
      dm.AQ17IES_PARAMETER_VALUE6.Value:=ComboBox6.Text;
      dm.AQ17IES_PARAMETER_VALUE7.Value:=ComboBox7.Text;
      dm.AQ17IES_PARAMETER_VALUE8.Value:=ComboBox8.Text;
      dm.AQ17IES_PARAMETER_VALUE9.Value:=ComboBox9.Text;
      dm.AQ17IES_PARAMETER_VALUE10.Value:=ComboBox10.Text;
    end;
    //--------------------2017-04-19-----------------------------------
    DM.AQ17INSPECT.Value:= inspect;
    dm.AQ17CATALOG_NUM.Value := catalog_num;
    DM.AQ17AVL_FLAG.Value := avl_flag;
    DM.AQ17SHELF_LIFE.Value:= shelf_life;

    //-----------------------------------------------------------------
    //2018-9-4tang添最后更新日期
    DM.AQ17LAST_CURNT_COST_UPDT.Value:=getsystem_date(dm.tmp,0);
    
    dm.AQ17.Post;
    dm.ado496.Close;
    dm.ado496.Open;

    if dm.ado496if_flag.Value=1 then            //作为初始值
    begin
      dm.ado496.Edit;
      dm.ado496mask_inv_number.Value := mask_value(trim(dm.ado496mask_inv_number.Value));
      dm.ado496.Post;
    end;
//    DM.AQ18.UpdateBatch;
    dm.ADOConnection1.CommitTrans;
    ModalResult:=mrok;
 except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
   abort;
  end;
 end;

end;

procedure TFrm_New.dbbox_visible;
var
 i:integer;
begin
 for i:=1 to 10 do
  FindChildControl('ComboBox'+inttostr(i)).Visible:=false;

 for i:=1 to dm.ADOQuery1.RecordCount do
  FindChildControl('ComboBox'+inttostr(i)).Visible:=True;

end;

procedure TFrm_New.dbbox_additem(i,rkey278:integer);
var
  LCBX: TComboBox;
begin
with dm.tmp do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey,tvalue from data0338');
  sql.Add('where parameter_ptr='+inttostr(rkey278));
  SQL.Add(' order by tvalue asc');
  open;
  case i of
     1: LCBX := ComboBox1;
     2: LCBX := ComboBox2;
     3: LCBX := ComboBox3;
     4: LCBX := ComboBox4;
     5: LCBX := ComboBox5;
     6: LCBX := ComboBox6;
     7: LCBX := ComboBox7;
     8: LCBX := ComboBox8;
     9: LCBX := ComboBox9;
    10: LCBX := ComboBox10 ;

  else
    LCBX := ComboBox1;
  end;
   lcbx.Items.Clear;
  while not eof do
    begin
     LCBX.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
     if trim(dm.tmp.fieldvalues['tvalue']) = Trim(DM.AQ17.fieldbyname('IES_PARAMETER_VALUE' + IntToStr(i)).AsString) then
        LCBX.ItemIndex := LCBX.Items.Count -1;
     next;
    end;
 end;
end;

procedure TFrm_New.init(rkey496:integer);
var
 i:integer;
begin
  Edit4.Enabled:=True;
  MaskEdit1.Enabled:=True;
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:=
    'SELECT data0278.rkey,dbo.Data0278.PARAMETER_NAME,'+
    '    dbo.Data0278.PARAMETER_DESC, dbo.Data0002.UNIT_NAME '+
    'FROM   dbo.Data0499 INNER JOIN'+
    '      dbo.Data0278 ON dbo.Data0499.PARAMETER_PTR = dbo.Data0278.RKEY INNER JOIN'+
    '      dbo.Data0002 ON dbo.Data0278.UNIT_PTR = dbo.Data0002.RKEY '+
    'where  data0499.ttype=0 and'+
    '       data0499.inv_group_ptr = '+inttostr(rkey496)+
    ' order by data0499.seq_no';
   open;
  end;

  if dm.ADOQuery1.IsEmpty then
   StringGrid1.RowCount :=2
  else
   StringGrid1.RowCount := dm.adoquery1.RecordCount+1;

  for i:=1 to stringgrid1.RowCount-1 do stringgrid1.Rows[i].Clear;

    dbbox_visible;

    for i:=1 to dm.ADOQuery1.RecordCount do
    begin
      stringgrid1.Cells[0,i] :=DM.adoquery1.fieldbyname('PARAMETER_NAME').AsString;
      stringgrid1.Cells[1,i] := dm.adoquery1.fieldbyname('PARAMETER_desc').asstring;
      StringGrid1.Cells[3,i] := dm.adoquery1.fieldbyname('UNIT_NAME').AsString;
      dbbox_additem(i,dm.ADOQuery1.fieldbyname('rkey').AsInteger);
      dm.ADOQuery1.Next;
    end;
end;

procedure TFrm_New.init2(rkey595:string);
var sl:string;
    i,j:Integer;
//    dd: TMycbb;
begin
  ComboBox1.Visible:=False;
  ComboBox2.Visible:=False;
  ComboBox3.Visible:=False;
  ComboBox4.Visible:=False;
  ComboBox5.Visible:=False;
  ComboBox6.Visible:=False;
  ComboBox7.Visible:=False;
  ComboBox8.Visible:=False;
  ComboBox9.Visible:=False;
  ComboBox10.Visible:=False;
  for j :=StringGrid1.RowCount-1  downto 1  do
  begin
    for i:=0 to StringGrid1.ColCount do
    begin
      StringGrid1.Cells[i,j]:='';
    end;
    stringgrid1.rowcount := stringgrid1.rowcount - 1;
  end;
  stringgrid1.Cells[0,0] := '序号';
  stringgrid1.Cells[1,0] := '编码名称';
  stringgrid1.Cells[2,0] := '对应值';
  StringGrid1.Cells[3,0] := '长度';
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:='select DATA0596.*,DATA0593.invt_ttyename,DATA0593.rkey593 as R593,DATA0593.length,DATA0595.TYPE_CODE,DATA0595.sufchar '
            +' from DATA0596 inner join DATA0593 on DATA0596.rkey593=DATA0593.rkey'
            +' inner join DATA0595 on DATA0596.rkey595=DATA0595.RKEY'
            +' where DATA0596.rkey595= '+rkey595+' order by rec_no ';
   open;
  end;

  if dm.ADOQuery1.IsEmpty then
   StringGrid1.RowCount :=2
  else
   StringGrid1.RowCount := dm.adoquery1.RecordCount+1;

  for i:=1 to stringgrid1.RowCount-1 do stringgrid1.Rows[i].Clear;

//    dbbox_visible;
  if not dm.ADOQuery1.IsEmpty then
  begin
    for i:=1 to dm.ADOQuery1.RecordCount do
    begin
      stringgrid1.Cells[0,i] :=DM.adoquery1.fieldbyname('rec_no').AsString;
      stringgrid1.Cells[1,i] := dm.adoquery1.fieldbyname('invt_ttyename').asstring;
      StringGrid1.Cells[3,i] := dm.adoquery1.fieldbyname('length').AsString;
      StringGrid1.Cells[4,i] :=DM.ADOQuery1.fieldByName('rkey593').AsString;
      StringGrid1.Cells[6,i] :=DM.ADOQuery1.fieldByName('R593').AsString;
      dm.ADOQuery1.Next;
    end;
    ComboBox1.Visible:=True;
    ComboBox1.Items.Clear;
    sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,1]);
    Additem(sl,ComboBox1,ComboBox11);
    strType595:=dm.ADOQuery1.fieldByName('sufchar').AsString;
    Edit4.Enabled:=False;
    MaskEdit1.Enabled:=False;
  end;
end;

procedure TFrm_New.BitBtn1Click(Sender: TObject);
begin
  try
    form_invtype:=tform_invtype.Create(application);
    form_invtype.Edit1.Text :=trim(edit1.Text);
    if form_invtype.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
      edit1.SetFocus;
    end
    else
    if form_invtype.ShowModal=mrok then
     begin
       edit1.Text := form_invtype.ADOQuery1GROUP_NAME.Value;
       edit1.Font.Color := clwindowtext;
       label7.Caption := form_invtype.ADOQuery1GROUP_DESC.Value;
       edit1.Tag:= form_invtype.ADOQuery1RKEY.Value;
       ctype.Caption := form_invtype.ADOQuery1DSDesigner.Value;
       //--------------------2017-04-19-----------------------------------
       inspect := Form_invtype.ADOQuery1INSPECT.value;
       shelf_life := Form_invtype.ADOQuery1SHELF_LIFE.value;
       catalog_num := Form_invtype.ADOQuery1CATALOG_NUM.Value;
       avl_flag := Form_invtype.ADOQuery1AVL_FLAG.Value;
       if_flag:= Form_invtype.ADOQuery1if_flag.Value;
       //tang2017-7-25---
       Rkey595:=Form_invtype.ADOQuery1Rkey595.AsString;
       Item593:='';
       //-----------------------------------------------------------------
       if form_invtype.ADOQuery1if_flag.Value=0 then //掩码
          MaskEdit1.EditMask:=form_invtype.ADOQuery1mask_inv_number.Value
       else
       if form_invtype.ADOQuery1if_flag.Value=1 then //更改if_flag =1（作为初始值）的处理情况
        begin
          MaskEdit1.EditMask :='';
          MaskEdit1.Text := form_invtype.ADOQuery1mask_inv_number.Value;
        end
       else                                      //手动
       if form_invtype.ADOQuery1if_flag.Value=2 then  //新增if_flag=2(手工输入)的处理情况
        begin
          MaskEdit1.EditMask :='';
          MaskEdit1.Text := '';
        end;
     //tang2017-7-25改类别的595Rkey不为空且类型为3，，按编码
        if ((if_flag=3) and (Rkey595<>'')) then
        begin
          init2(Rkey595);
        end else
        begin
     //end 2017-7-26
          init(form_invtype.ADOQuery1RKEY.Value);   //ies参数值
          MaskEdit1.SetFocus;
        end;
     end
    else
      edit1.SetFocus;
 finally
   form_invtype.free;
 end;

end;

procedure TFrm_New.Edit1Click(Sender: TObject);
begin
  if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color :=clblue;
  end;
end;

procedure TFrm_New.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (trim(edit1.Text)<>'') then
 with dm.tmp do
 begin
    close;
    Sql.Text :='SELECT DATA0496.RKEY, DATA0496.GROUP_DESC,  ' + #13 +
      'CASE DATA0496.TTYPE WHEN ''P'' THEN ''原材料'' WHEN ''T'' THEN ''外发加工'' ELSE ''杂项'' END AS CTYPE, '  + #13 +
      'DATA0496.IF_FLAG, DATA0496.MASK_INV_NUMBER,INSPECT,SHELF_LIFE,CATALOG_NUM,AVL_FLAG,Rkey595 '+#13+
      'FROM DATA0496 ' + #13 +
      'WHERE GROUP_NAME = '+ quotedstr(trim(edit1.Text));
    OPEN;
    if isempty then
    begin
     messagedlg('物料类别输入错误!请重新输入或选择！',mterror,[mbcancel],0);
     label7.Caption:='';
     edit1.SetFocus;
    end
    else
  if Edit1.Tag<>fieldbyname('rkey').Value then
  begin
    edit1.Font.Color:=clwindowtext;
    label7.Caption:=fieldbyname('GROUP_DESC').AsString;

    Edit1.Tag :=  fieldbyname('rkey').Value;

        //--------------------2017-04-19-----------------------------------
       inspect := fieldbyname('INSPECT').AsString;
       shelf_life := fieldbyname('SHELF_LIFE').AsInteger;
       catalog_num := fieldbyname('CATALOG_NUM').asstring;
       avl_flag := fieldbyname('AVL_FLAG').asstring;
        //tang2017-7-25---
       Rkey595:= fieldbyname('Rkey595').asstring;
      //-----------------------------------------------------------------

    ctype.Caption := fieldbyname('CTYPE').AsString;

   if fieldbyname('IF_FLAG').Value = 0 then
      MaskEdit1.EditMask:=  fieldbyname('MASK_INV_NUMBER').AsString
   else
   if fieldbyname('IF_FLAG').Value = 1 then //更改if_flag =1（作为初始值）的处理情况
    begin
      MaskEdit1.EditMask:= '';
      MaskEdit1.Text := fieldbyname('MASK_INV_NUMBER').AsString
    end
   else
   if fieldbyname('IF_FLAG').Value = 2 then  //新增if_flag=2(手工输入)的处理情况
    begin
      MaskEdit1.EditMask:= '';
      MaskEdit1.Text := '';
    end;
 //tang2017-7-25改类别的595Rkey不为空且类型为3，，按编码
    if ((if_flag=3) and (Rkey595<>'')) then
    begin
      init2(Rkey595);

    end else
 //end 2017-7-26
    init(Edit1.Tag);
  end;

 end
else
 edit1.Font.Color :=clblue;
end;

procedure TFrm_New.BitBtn2Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;
  form_unit.Edit1.Text :=trim(edit2.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit2.Font.Color := clwindowtext;
     label8.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
//     dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      edit2.Tag:=form_unit.ADOQuery1.FieldValues['rkey'];
     if edit3.Font.Color = clblue then
      begin
       edit3.Text := edit2.Text;
       edit3.Font.Color := clwindowtext;
       label9.Caption := label8.Caption;
//       dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
       edit3.tag:=form_unit.ADOQuery1.FieldValues['rkey'];
      end;
     edit3.SetFocus;
    end
   else
    edit2.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TFrm_New.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.SelectAll;
   edit2.Font.Color :=clblue;
  end;
end;

procedure TFrm_New.Edit2Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn2') and (trim(edit2.Text)<>'') then
// try
//  form_unit := Tform_unit.Create(Application);
//  with form_unit.ADOQuery1 do
//   begin
//    close;
//    SQL.Insert(1,'where stock=''Y''');
//    open;
//   end;
//  form_unit.Edit1.Text:=trim(edit2.Text);
// if comparetext(trim(edit2.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
//  begin
//   edit2.Font.Color:=clwindowtext;
//   label8.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
//   //dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
//   edit2.Tag:= form_unit.ADOQuery1.FieldValues['rkey'];
//   if edit3.Font.Color = clblue then
//    begin
//     edit3.Text := edit2.Text;
//     edit3.Font.Color := clwindowtext;
//     label9.Caption := label8.Caption;
//     edit3.Tag:=form_unit.ADOQuery1.FieldValues['rkey'];
//     //dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
//    end;
//  end
// else
//  begin
//   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
//   label8.Caption:='';
//   edit2.SetFocus;
//  end;
// finally
//  form_unit.free;
// end;
  with dm.tmp do
  begin
    sql.Clear;
    close;
    sql.Text:='SELECT RKEY,UNIT_CODE,UNIT_NAME '+#13+
    'FROM DATA0002 WHERE STOCK = ''Y'' AND UNIT_CODE = '+ quotedstr(trim(edit2.Text)) +#13+
    'ORDER BY UNIT_CODE';
    OPEN;
    if isempty then
    begin
      messagedlg('单位代码不正确,请重新输入或选择',mterror,[mbcancel],0);
      label8.Caption := '';
      edit2.SetFocus;
    end
    else
    begin
      edit2.Font.Color:=clwindowtext;
      label8.Caption:=fieldbyname('unit_name').AsString;
      edit2.Tag:= fieldbyname('rkey').Value;
      if edit3.Font.Color = clblue then
      begin
       edit3.Text := edit2.Text;
       edit3.Font.Color := clwindowtext;
       label9.Caption := label8.Caption;
       edit3.Tag:=fieldbyname('rkey').Value;
      end;
    end;
  end;
end;

procedure TFrm_New.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color :=clblue;
  end;
end;
procedure TFrm_New.BitBtn3Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;
  form_unit.Edit1.Text :=trim(edit3.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit3.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit3.Font.Color := clwindowtext;
     label9.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
//     dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      edit3.Tag:= form_unit.ADOQuery1.FieldValues['rkey'];
     if edit2.Font.Color = clblue then
      begin
       edit2.Text := edit3.Text;
       edit2.Font.Color := clwindowtext;
       label8.Caption := label9.Caption;
       edit2.tag:=form_unit.ADOQuery1.FieldValues['rkey'];
//       dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      end;
    end
   else
    edit3.SetFocus;

 finally
  form_unit.free;
 end;
end;
procedure TFrm_New.Edit3Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn3') and (trim(edit3.Text)<>'') then
// try
//  form_unit := Tform_unit.Create(Application);
//  with form_unit.ADOQuery1 do
//   begin
//    close;
//    SQL.Insert(1,'where purch=''Y''');
//    open;
//   end;
//  form_unit.Edit1.Text:=trim(edit3.Text);
// if comparetext(trim(edit3.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
//  begin
//   edit3.Font.Color:=clwindowtext;
//   label9.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
//   //dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
//   edit3.tag:= form_unit.ADOQuery1.FieldValues['rkey'];
//   if edit2.Font.Color = clblue then
//    begin
//     edit2.Text := edit3.Text;
//     edit2.Font.Color := clwindowtext;
//     label8.Caption := label9.Caption;
//     //dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
//     edit2.tag:= form_unit.ADOQuery1.FieldValues['rkey'];
//    end;
//  end
// else
//  begin
//   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
//   label9.Caption:='';
//   edit3.SetFocus;
//  end;
// finally
//  form_unit.free;
// end
  with dm.tmp do
  begin
    sql.Clear;
    close;
    sql.Text:='SELECT RKEY,UNIT_CODE,UNIT_NAME '+#13+
    'FROM DATA0002 WHERE PURCH = ''Y'' AND UNIT_CODE = '+ quotedstr(trim(edit3.Text)) +#13+
    'ORDER BY UNIT_CODE';
    OPEN;
    if isempty then
    begin
      messagedlg('单位代码不正确,请重新输入或选择',mterror,[mbcancel],0);
      label9.Caption := '';
      edit3.SetFocus;
    end
    else
    begin
      edit3.Font.Color:=clwindowtext;
      label9.Caption:=fieldbyname('unit_name').AsString;
      edit3.Tag := fieldbyname('rkey').Value;
      if edit2.Font.Color = clblue then
      begin
        edit2.Text := edit3.Text;
        edit2.Font.Color := clwindowtext;
        label8.Caption := label9.Caption;
        edit2.Tag := fieldbyname('rkey').Value;
      end;
    end;
  end
  else
  edit3.Font.Color :=clblue;

end;

procedure TFrm_New.Button2Click(Sender: TObject);
begin
  dm.AQ18.Close;
end;

procedure TFrm_New.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.AQ17INV_PART_NUMBER.EditMask:='';
end;

function TFrm_New.mask_value(inv_number: string): string;
var
 v_leng,i:byte;
 v_last:extended;
begin
 v_leng := length(inv_number);
 for i := v_leng downto 1 do
  begin
   if (copy(inv_number,i,1) < '0') or (copy(inv_number,i,1) > '9')  then //如果不是数字
    begin
     v_last := power(10,v_leng-i) + StrToInt64(copy(inv_number,i+1,v_leng-i))+1;
     result := copy(inv_number,1,i) + copy(floattostr(v_last),2,v_leng-i);
     break;
    end
   else                                      //如果是数字
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := power(10,v_leng)+StrToInt64(inv_number)+1;
      result := copy(floattostr(v_last),2,v_leng);
     end;
  end;
end;

function TFrm_New.Power(x, y : extended) : extended;
 begin
  result := exp(y*ln(x));
 end;

function TFrm_New.svValid: boolean;
begin
  result:=false;
 if trim(maskedit1.Text)='' then
  begin
   messagedlg('材料代码不能为空!',mtwarning,[mbok],0);
   MaskEdit1.SetFocus;
   exit;
  end;
 if trim(edit5.Text)='' then
  begin
   messagedlg('材料名称不能为空!',mtwarning,[mbok],0);
   edit5.SetFocus;
   exit;
  end;
 if trim(edit4.Text)='' then
  begin
   messagedlg('材料规格不能为空!',mtwarning,[mbok],0);
   edit4.SetFocus;
   exit;
  end;

 if edit1.Font.Color =clblue then
  begin
   messagedlg('材料类别不能为空!',mtwarning,[mbok],0);
   edit1.SetFocus;
   exit;
  end;

 if edit2.Font.Color =clblue then
  begin
   messagedlg('存货单位不能为空!',mtwarning,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
 if edit3.Font.Color =clblue then
  begin
   messagedlg('采购单位不能为空!',mtwarning,[mbok],0);
   edit3.SetFocus;
   exit;
  end;

 with DM.tmp do
  begin
    Close;
    SQL.Text:='select rkey from data0017 where INV_PART_NUMBER='+quotedstr(MaskEdit1.Text);
    open;
    if not  IsEmpty then
     begin
       messagedlg('材料代码重复!',mtwarning,[mbok],0);
       MaskEdit1.SetFocus;
       exit;
     end;
  end;

  result:=true;
end;


procedure TFrm_New.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (acol=3) then //and (arow=stringgrid1.RowCount-1) then
   canselect:=false;
end;


procedure TFrm_New.ComboBox1Change(Sender: TObject);
var i:integer;
    strcb,strtxt:string;
begin
  ComboBox11.ItemIndex:=ComboBox1.ItemIndex;
  if ((if_flag<>3) and (Rkey595='')) then
  begin
    with TStringList.Create do
    begin
      Delimiter:=' ';
      for i:=0 to ControlCount-1 do
      if (Controls[i].Tag>=11) and (Controls[i].Tag<=20) then
      begin
        if TComboBox(Controls[i]).Visible=True then
        Add(TComboBox(Controls[i]).Text);
      end;
      Edit4.Text:=TrimLeft(DelimitedText);
      free;
    end;
  end else
  if ((if_flag=3) and (Rkey595<>'')) then
  begin
    strcb:='';
    strtxt:='';
    for i:=0 to ControlCount-1 do
    if (Controls[i].Tag>=11) and (Controls[i].Tag<=20) then
    begin
      strcb:=TComboBox(Controls[i]).Text;
      strtxt:=strtxt+strcb+' ';
    end;
    Edit4.Text:=TrimLeft(strtxt);
    strcb:='';
    strtxt:='';
    for i:=0 to ControlCount-1 do
    if (Controls[i].Tag>=21) and (Controls[i].Tag<=30) then
    begin
      strcb:=TComboBox(Controls[i]).Text;
      strtxt:=strtxt+strcb;
    end;
    MaskEdit1.Text:=TrimLeft(strtxt);
  end;
end;

procedure TFrm_New.FormActivate(Sender: TObject);
begin
  strSGTxt:='';
   stringgrid1.Cells[0,0] := '参数代码';
   stringgrid1.Cells[1,0] := '参数名称';
   stringgrid1.Cells[2,0] := '值';
   StringGrid1.Cells[3,0] := '单位';
   StringGrid1.ColWidths[4]:=-1;
   StringGrid1.ColWidths[5]:=-1;
   StringGrid1.ColWidths[6]:=-1;
   StringGrid1.ColWidths[7]:=-1;
end;

procedure TFrm_New.ComboBox1Exit(Sender: TObject);
var sl:string;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox1.Text)<>'') and (StringGrid1.RowCount>2)) then
  begin
    if (Trim(ComboBox1.Text)<>Trim(StringGrid1.Cells[2,1])) then
    begin
        ComboBox2.Visible:=True;
        sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,2]);
        Additem(sl,ComboBox2,ComboBox12);
        StringGrid1.Cells[2,1]:=ComboBox1.Text;
        StringGrid1.Cells[5,1]:=ComboBox11.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox3Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox3.Text)<>'') and (StringGrid1.RowCount>4)) then
  begin
    if (Trim(ComboBox3.Text)<>Trim(StringGrid1.Cells[2,3])) then
    begin
        ComboBox4.Visible:=True;
        if (trim(StringGrid1.Cells[6,4])<>'') then
        begin
          sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,4])+' and filter_name='''+ComboBox3.Text+'''';
        end else sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,4]);
        Additem(sl,ComboBox4,ComboBox14);
        StringGrid1.Cells[2,3]:=ComboBox3.Text;
        StringGrid1.Cells[5,3]:=ComboBox13.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox2Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox2.Text)<>'') and (StringGrid1.RowCount>3)) then
  begin
    if (Trim(ComboBox2.Text)<>Trim(StringGrid1.Cells[2,2])) then
    begin
        ComboBox3.Visible:=True;
        if (trim(StringGrid1.Cells[6,3])<>'') then
        begin
          sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,3])+' and filter_name='''+ComboBox2.Text+'''';
        end else sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,3]);
        Additem(sl,ComboBox3,ComboBox13);
        StringGrid1.Cells[2,2]:=ComboBox2.Text;
        StringGrid1.Cells[5,2]:= ComboBox12.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox4Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox4.Text)<>'') and (StringGrid1.RowCount>5)) then
  begin
    if (Trim(ComboBox4.Text)<>Trim(StringGrid1.Cells[2,4])) then
    begin
      ComboBox5.Visible:=True;
      if (trim(StringGrid1.Cells[6,5])<>'') then
      begin
        sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,5])+' and filter_name='''+ComboBox4.Text+'''';
      end else sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,5]);
      Additem(sl,ComboBox5,ComboBox15);
      StringGrid1.Cells[2,4]:=ComboBox4.Text;
      StringGrid1.Cells[5,4]:=ComboBox14.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox5Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox5.Text)<>'') and (StringGrid1.RowCount>6)) then
  begin
    if (Trim(ComboBox5.Text)<>Trim(StringGrid1.Cells[2,5])) then
    begin
      ComboBox6.Visible:=True;
      if (trim(StringGrid1.Cells[6,6])<>'') then
      begin
        sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,6])+' and filter_name='''+ComboBox5.Text+'''';
      end else sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,6]);
      Additem(sl,ComboBox6,ComboBox16);
      StringGrid1.Cells[2,5]:=ComboBox5.Text;
      StringGrid1.Cells[5,5]:=ComboBox15.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox6Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox6.Text)<>'') and (StringGrid1.RowCount>7)) then
  begin
    if (Trim(ComboBox6.Text)<>Trim(StringGrid1.Cells[2,6])) then
    begin
      ComboBox7.Visible:=True;
      if (trim(StringGrid1.Cells[6,7])<>'') then
      begin
        sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,7])+' and filter_name='''+ComboBox6.Text+'''';
      end else sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,7]);
      Additem(sl,ComboBox7,ComboBox17);
      StringGrid1.Cells[2,6]:=ComboBox6.Text;
      StringGrid1.Cells[5,6]:=ComboBox16.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox7Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox7.Text)<>'') and (StringGrid1.RowCount>8)) then
  begin
    if (Trim(ComboBox7.Text)<>Trim(StringGrid1.Cells[2,7])) then
    begin
      ComboBox8.Visible:=True;
      if (trim(StringGrid1.Cells[6,8])<>'') then
      begin
        sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,8])+' and filter_name='''+ComboBox7.Text+'''';
      end else sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,8]);
      Additem(sl,ComboBox8,ComboBox18);
      StringGrid1.Cells[2,7]:=ComboBox7.Text;
      StringGrid1.Cells[5,7]:=ComboBox17.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox8Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
  if ((if_flag=3) and (Rkey595<>'') and (Trim(ComboBox8.Text)<>'') and (StringGrid1.RowCount>9)) then
  begin
    if (Trim(ComboBox8.Text)<>Trim(StringGrid1.Cells[2,8])) then
    begin
      ComboBox9.Visible:=True;
      if (trim(StringGrid1.Cells[6,9])<>'') then
      begin
        sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,9])+' and filter_name='''+ComboBox8.Text+'''';
      end else sl:='select * from data0594 where rkey593='+trim(StringGrid1.Cells[4,9]);
      Additem(sl,ComboBox9,ComboBox19);
      StringGrid1.Cells[2,8]:=ComboBox8.Text;
      StringGrid1.Cells[5,8]:=ComboBox18.Text;
    end;
  end;
end;

procedure TFrm_New.ComboBox9Exit(Sender: TObject);
begin
  StringGrid1.Cells[2,9]:=ComboBox9.Text;
  StringGrid1.Cells[5,9]:=ComboBox19.Text;
end;

procedure TFrm_New.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (StringGrid1.col= 3) then abort;
end;

procedure TFrm_New.ComboBox2Change(Sender: TObject);
begin
  ComboBox12.ItemIndex:=ComboBox2.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox3Change(Sender: TObject);
begin
  ComboBox13.ItemIndex:=ComboBox3.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox4Change(Sender: TObject);
begin
  ComboBox14.ItemIndex:=ComboBox4.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox5Change(Sender: TObject);
begin
  ComboBox15.ItemIndex:=ComboBox5.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox6Change(Sender: TObject);
begin
  ComboBox16.ItemIndex:=ComboBox6.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox7Change(Sender: TObject);
begin
  ComboBox17.ItemIndex:=ComboBox7.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox8Change(Sender: TObject);
begin
  ComboBox18.ItemIndex:=ComboBox8.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox9Change(Sender: TObject);
begin
  ComboBox19.ItemIndex:=ComboBox9.ItemIndex;
  ComboBox1Change(nil);
end;

procedure TFrm_New.ComboBox10Change(Sender: TObject);
begin
  ComboBox20.ItemIndex:=ComboBox10.ItemIndex;
  ComboBox1Change(nil);
end;

end.
