unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, DBCtrls, Grids,
  ImgList, Menus, DB, ADODB, DBGrids, ExtDlgs;

type
  TFrm_detail = class(TForm)
    HeaderControl1: THeaderControl;
    StatusBar1: TStatusBar;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBCheckBox5: TDBCheckBox;
    Label16: TLabel;
    DBCheckBox6: TDBCheckBox;
    Label18: TLabel;
    DBEdit10: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Edit6: TEdit;
    BitBtn8: TBitBtn;
    Label21: TLabel;
    DBEdit11: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Memo1: TMemo;
    Label27: TLabel;
    BitBtn9: TBitBtn;
    Label28: TLabel;
    Bevel1: TBevel;
    Label31: TLabel;
    Edit7: TEdit;
    BitBtn10: TBitBtn;
    Edit8: TEdit;
    BitBtn11: TBitBtn;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    ComboBox1: TComboBox;
    TreeView2: TTreeView;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBEdit18: TDBEdit;
    ctype: TLabel;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    Label29: TLabel;
    Label51: TLabel;
    DBEdit17: TDBEdit;
    DBEdit22: TDBEdit;
    Label52: TLabel;
    Label53: TLabel;
    DBGrid1: TDBGrid;
    Label54: TLabel;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    DBComboBox9: TDBComboBox;
    DBComboBox10: TDBComboBox;
    Label32: TLabel;
    Label50: TLabel;
    Label55: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label30: TLabel;
    Label56: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label57: TLabel;
    ComboBox2: TComboBox;
    Label58: TLabel;
    CheckBox1: TCheckBox;
    btn1: TSpeedButton;
    DBEdit30: TDBEdit;
    Label59: TLabel;
    Label60: TLabel;
    DBEdit31: TDBEdit;
    Label61: TLabel;
    DBEdit29: TDBEdit;
    Panel2: TPanel;
    BtnSave: TBitBtn;
    BtnCanel: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label62: TLabel;
    StringGrid2: TStringGrid;
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
    ComboBox21: TComboBox;
    ComboBox22: TComboBox;
    DBEdit32: TDBEdit;
    procedure BtnCanelClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BtnSaveClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit7Click(Sender: TObject);
    procedure Edit8Click(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure TreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    function mask_value(inv_number:string):string;
    function Power(x, y : extended) : extended;
    procedure ComboBox2Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure ComboBox6Exit(Sender: TObject);
    procedure ComboBox7Exit(Sender: TObject);
    procedure ComboBox8Exit(Sender: TObject);
    procedure ComboBox9Exit(Sender: TObject);
    procedure ComboBox10Exit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    v_close:byte;
    inv_part_number,INV_NAME,INV_DESCRIPTION,CONSIGN_ONHAND_QTY:string;
    SHELF_LIFE:integer;//有效期天数
    strType595:string;
    function svValid:boolean;
    procedure dbbox_visible;
    procedure dbbox_additem(i:byte);
    procedure update_note;
    procedure init;
    procedure init2(rkey595:string);
    procedure Additem(Asql:string; ccb: TComboBox; ccb2: TComboBox);  //
    function GetCbbItem(ccb: TComboBox): string;
    function GetCbbItemText(ccb: TComboBox): string;
    function getTypeName(code:string):string;
  public
    FEdtState:string;
    flag496:Integer;//材料编码控制方式0:掩码1:初始值2:手工输入3:规则输入
    Rkey595:string;//Rkey595指针
    Rkey17:Integer;//17Rkey
    { Public declarations }
  end;

var
  Frm_detail: TFrm_detail;

implementation

uses damo, empl_search,warehouse_search, loca_search,common,
     supplier_search, Unit_search, account_search, note_search,
     ConstVar, Pick_Item_Single, invtype_search, Frm_New_u;


{$R *.dfm}
function TFrm_detail.getTypeName(code:string):string;
var s1:string;
begin
  s1:=code;
  Result:='';
  if (s1<>'') then
  begin
    DM.tmp.Close;
    dm.tmp.SQL.Text:='select * from DATA0594 where type_name='''+s1+'''';
    dm.tmp.Open;
    if not dm.tmp.IsEmpty then
    Result:=DM.tmp.fieldBYname('type_code').AsString;
  end;
end;

function TFrm_detail.GetCbbItemText(ccb:TComboBox):string;//取前值
var itmp:Integer;
    strtmp:string;
begin
  Result:='';
  itmp:=Pos('(',ccb.Text);
  strtmp:=Copy(ccb.Text,1,itmp-1);
  Result:=strtmp;
end;

function TFrm_detail.GetCbbItem(ccb:TComboBox):string; //取后值
var itmp,itmp2:Integer;
    strtmp:string;
begin
  Result:='';
  itmp:=Pos('(',ccb.Text);
  itmp2:=Pos(')',ccb.Text);
  strtmp:=Copy(ccb.Text,itmp+1,itmp2-itmp-1);
  Result:=strtmp;
end;

procedure TFrm_detail.Additem(Asql:string; ccb: TComboBox; ccb2: TComboBox);
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

procedure TFrm_detail.init2(rkey595:string);
var sl:string;
    i,k:Integer;
    comdd,comdd2:TComboBox;
//    dd: TMycbb;
begin
  stringgrid2.Cells[0,0] := '序号';
  stringgrid2.Cells[1,0] := '编码名称';
  stringgrid2.Cells[2,0] := '对应值';
  StringGrid2.Cells[3,0] := '长度';
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:='select DATA0596.*,DATA0593.invt_ttyename,DATA0593.rkey593 as R593,DATA0593.length,DATA0595.TYPE_CODE,DATA0595.sufchar'
            +' from DATA0596 inner join DATA0593 on DATA0596.rkey593=DATA0593.rkey'
            +' inner join DATA0595 on DATA0596.rkey595=DATA0595.RKEY'
            +' where DATA0596.rkey595= '+rkey595+' order by rec_no ';
   open;
  end;
  dm.tmpAdo.Close;
  dm.tmpAdo.SQL.Text:='select * from data0017 where Rkey='+inttostr(Rkey17);
  DM.tmpAdo.Open;

  if dm.ADOQuery1.IsEmpty then
   StringGrid2.RowCount :=2
  else
   StringGrid2.RowCount := dm.adoquery1.RecordCount+1;

  for i:=1 to stringgrid2.RowCount-1 do stringgrid2.Rows[i].Clear;

//    dbbox_visible;
  if not dm.ADOQuery1.IsEmpty then
  begin
    for i:=1 to dm.ADOQuery1.RecordCount do
    begin
      stringgrid2.Cells[0,i] :=DM.adoquery1.fieldbyname('rec_no').AsString;
      stringgrid2.Cells[1,i] := dm.adoquery1.fieldbyname('invt_ttyename').asstring;
      StringGrid2.Cells[2,i]:=dm.tmpAdo.fieldByName('IES_PARAMETER_VALUE'+inttostr(i)).AsString;
      StringGrid2.Cells[3,i] := dm.adoquery1.fieldbyname('length').AsString;
      StringGrid2.Cells[4,i] :=DM.ADOQuery1.fieldByName('rkey593').AsString;
      StringGrid2.Cells[5,i] :=getTypeName(StringGrid2.Cells[2,i]);
      StringGrid2.Cells[6,i] :=DM.ADOQuery1.fieldByName('R593').AsString;
//      StringGrid2.Cells[7,i] :=StringGrid2.Cells[2,i]+'('+Trim(StringGrid2.Cells[5,i])+')';
      dm.ADOQuery1.Next;
    end;
  end;
  strType595:=dm.ADOQuery1.fieldByName('sufchar').AsString;
  comdd:=TCombobox.Create(Self);
  comdd2:=TCombobox.Create(Self);
  k:=1;
  stringgrid2.Visible:=True;
  for i := 1 to Panel1.ControlCount-1 do
  begin
    if (Panel1.Controls[i].Tag>=11) and (Panel1.Controls[i].Tag<=20) then
    begin
      comdd:=TComboBox(Panel1.Controls[i]);
      comdd2:=TComboBox(Panel1.Controls[i+10]);
      if (trim(StringGrid2.Cells[4,k])<>'') then
      begin
        comdd.Visible:=False;
        comdd.Items.Clear;
        sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,k]);
        Additem(sl,comdd,comdd2);
        comdd.ItemIndex:=comdd.Items.IndexOf(StringGrid2.Cells[2,k]);
        comdd2.ItemIndex:=comdd.ItemIndex;
        k:=k+1;
      end;
    end
  end;
  stringgrid2.Row:=1;
  StringGrid2.Col:=3;
//  ComboBox3.Visible:=True;
//  ComboBox3.Items.Clear;
//  sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,1]);
//  Additem(sl,ComboBox3);
//  ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(StringGrid2.Cells[7,1]);
end;

procedure TFrm_detail.BtnCanelClick(Sender: TObject);
begin
  v_close:=0;
  ModalResult:=mrcancel;
end;

procedure TFrm_detail.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 notebook1.PageIndex:=node.SelectedIndex;
 if (node.SelectedIndex=4) and (treeview2.Items.Count<>0) then
     treeview2.Items[0].Selected:=true;
 headercontrol1.Sections[1].Text:=node.Text;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
    dNewDate:TDateTime;
begin
  if not svValid then exit;
  //20171108tang
  if (SHELF_LIFE=0) and (dbedit10.Text='') then
  DM.AQ17SHELF_LIFE.Value:=0;
  //end-20171108tang---

//------------------
  if (CheckBox1.Checked) then
    dm.AQ17CATALOG_NUM.Value:='Y'
  else
    dm.AQ17CATALOG_NUM.Value:='N';
//---------------
   //2018-9-4
   if FEdtState='Edt' then
   begin
     dNewDate:=getsystem_date(dm.tmp,0);
     dm.AQ17LAST_CURNT_COST_UPDT.Value:=dNewDate;
   end;
//2018-8-07tang
    if (flag496=3) and (Rkey595<>'') then
    begin
      DM.AQ17INV_PART_NUMBER.Value:=strType595+DM.AQ17INV_PART_NUMBER.Value;

      if (Trim(ComboBox3.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE1.Value:=ComboBox3.Text;
      if (Trim(ComboBox4.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE2.Value:=ComboBox4.Text;
      if (Trim(ComboBox5.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE3.Value:=ComboBox5.Text;
      if (Trim(ComboBox6.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE4.Value:=ComboBox6.Text;
      if (Trim(ComboBox7.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE5.Value:=ComboBox7.Text;
      if (Trim(ComboBox8.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE6.Value:=ComboBox8.Text;
      if (Trim(ComboBox9.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE7.Value:=ComboBox9.Text;
      if (Trim(ComboBox10.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE8.Value:=ComboBox10.Text;
      if (Trim(ComboBox11.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE9.Value:=ComboBox11.Text;
      if (Trim(ComboBox12.Text)<>'') then
      dm.AQ17IES_PARAMETER_VALUE10.Value:=ComboBox12.Text;
    end;
//end2018-8-07
  try
    dm.ADOConnection1.BeginTrans;
    if not dm.AQ1711.IsEmpty then
    with dm.AQ1711 do             //记事本
    begin
     if trim(memo1.Text)<>'' then
     begin
       edit;
       for i:=1 to 4 do
       if memo1.Lines.Count>=i then
          FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=memo1.Lines[i-1]
       else
          FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:='';
       post;
     end else
       Delete;
    end else  if trim(memo1.Text)<>'' then     //如果原来没有记事本
    with dm.AQ1711 do
    begin
     append;
     FieldValues['file_pointer']:=dm.AQ17RKEY.Value;
     FieldValues['source_type']:=17;
     for i:=1 to memo1.Lines.Count do
     begin
        if memo1.Lines.Count>4 then break;
        FieldValues['NOTE_PAD_LINE_'+inttostr(i)]:=memo1.Lines[i-1];
     end;
     post;
    end;

    if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then dm.AQ17STOCK_PURCH.Value:=1;   //转换率
    dm.AQ17CONSIGN_ONHAND_QTY.AsString:=formatfloat('0.00',dm.AQ17CONSIGN_ONHAND_QTY.AsFloat);
    dm.AQ17CONSIGN_QTY_IN_INSP.AsString:=formatfloat('0.00',dm.AQ17CONSIGN_QTY_IN_INSP.AsFloat);

//    if Edit1.Tag <> 0 then
//      DM.AQ17GROUP_PTR.AsInteger := Edit1.Tag;
    if FEdtState='Edt' then update_note;     //日志文件更改记录
    try
      dm.AQ17.Post;
    except
      on E: Exception do
      begin

        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;


    if  FEdtState='Cop' then     //复制
    begin
      dm.ado496.Close;
      dm.ado496.Open;
      if dm.ado496if_flag.Value=1 then            //作为初始值
      begin
        dm.ado496.Edit;
        dm.ado496mask_inv_number.Value := mask_value(trim(dm.ado496mask_inv_number.Value));
        dm.ado496.Post;
      end;
    end;

    dm.AQ18.First;
    while not dm.AQ18.eof do
    begin
      dm.AQ18.edit;
      dm.AQ18invent_ptr.Value := dm.AQ17RKEY.Value;
      dm.AQ18.post;
      dm.AQ18.next;
    end;
    dm.AQ18.UpdateBatch(arall);  //工厂
    dm.ADOConnection1.CommitTrans;
    ModalResult:=mrok;
  except
    dm.ADOConnection1.RollbackTrans;
    showmessage('数据保存失败,请检查编码是否重复...');
    abort;
  end;

end;

procedure TFrm_detail.BitBtn5Click(Sender: TObject);
begin
 try
  form_empl:=tform_empl.Create(application);  //雇员
  form_empl.Edit1.Text :=trim(edit3.Text);
  if form_empl.ADOQuery1.IsEmpty then
  begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit3.SetFocus;
  end
  else
   if form_empl.ShowModal=mrok then
    begin
     edit3.Text := form_empl.ADOQuery1.FieldValues['empl_code'];
     edit3.Font.Color := clwindowtext;
     label37.Caption := form_empl.ADOQuery1.FieldValues['employee_name'];
     dm.AQ17AUTHORIZED_BUYER_PTR.Value := form_empl.ADOQuery1.FieldValues['rkey'];
     edit4.SetFocus;
    end
   else
    edit3.SetFocus;
 finally
  form_empl.free;
 end;
end;

procedure TFrm_detail.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color :=clblue;
  end;
end;

procedure TFrm_detail.Edit3Exit(Sender: TObject);
begin
 if FEdtState='Look' then exit;
 if (activecontrol.Name<>'BitBtn5') and (trim(edit3.Text)<>'') then
 try
  form_empl := Tform_empl.Create(Application);
  form_empl.Edit1.Text:=trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_empl.ADOQuery1.Fieldbyname('empl_code').AsString))=0 then
 begin
   edit3.Font.Color:=clwindowtext;
   label37.Caption:=form_empl.ADOQuery1.FieldValues['employee_name'];
   dm.AQ17AUTHORIZED_BUYER_PTR.Value := form_empl.ADOQuery1.FieldValues['rkey'];
 end
 else
 begin
   messagedlg('替代材料名称不正确,请重新输入或选择',mtinformation,[mbok],0);
   label37.Caption := '';
   edit3.SetFocus;
 end;
 finally
  form_empl.free;
 end
else
 if (activecontrol.Name<>'BitBtn5') and (trim(edit3.Text)='') then
  begin
   dm.AQ17AUTHORIZED_BUYER_PTR.AsVariant :=null;
   label37.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TFrm_detail.BitBtn6Click(Sender: TObject);
begin
 try
  form_supp:=tform_supp.Create(application); // 供应商
  form_supp.Edit1.Text :=trim(edit4.Text);
  if form_supp.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit4.SetFocus;
   end
  else
   if form_supp.ShowModal=mrok then
    begin
     edit4.Text := form_supp.ADOQuery1.FieldValues['code'];
     edit4.Font.Color := clwindowtext;
     label38.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
     dm.AQ17PREF_SUPPLIER_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
     edit5.SetFocus;
    end
   else
    edit4.SetFocus;
 finally
  form_supp.free;
 end;
end;

procedure TFrm_detail.Edit4Click(Sender: TObject);
begin
 if edit4.Font.Color=clwindowtext then
  begin
   edit4.SelectAll;
   edit4.Font.Color :=clblue;
  end;
end;

procedure TFrm_detail.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (trim(edit4.Text)<>'') then
 try
  form_supp := Tform_supp.Create(Application);
  form_supp.Edit1.Text:=trim(edit4.Text);
 if comparetext(trim(edit4.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit4.Font.Color:=clwindowtext;
   label38.Caption:=form_supp.ADOQuery1.FieldValues['supplier_name'];
   dm.AQ17PREF_SUPPLIER_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label38.Caption := '';
   edit4.SetFocus;
  end;
 finally
  form_supp.free;
 end
else
 if (activecontrol.Name<>'BitBtn6') and (trim(edit4.Text)='') then
  begin
   dm.AQ17PREF_SUPPLIER_PTR.AsVariant :=null;
   label38.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TFrm_detail.BitBtn7Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);   //单位
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;
  form_unit.Edit1.Text :=trim(edit5.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit5.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit5.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit5.Font.Color := clwindowtext;
     label39.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
     label41.Caption := edit5.Text;
     label44.Caption := edit5.Text;
     dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
     if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
      dm.AQ17STOCK_PURCH.Value:=1;
     dbedit7.SetFocus;
    end
   else
    edit5.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TFrm_detail.BitBtn8Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;
  form_unit.Edit1.Text :=trim(edit6.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit6.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit6.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit6.Font.Color := clwindowtext;
     label42.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
     label43.Caption := edit6.Text;
     label40.Caption := edit6.Text;
     dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
     if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
      dm.AQ17STOCK_PURCH.Value:=1;
     dbedit11.SetFocus;
    end
   else
    edit6.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TFrm_detail.Edit5Click(Sender: TObject);
begin
 if edit5.Font.Color=clwindowtext then
  begin
   edit5.SelectAll;
   edit5.Font.Color :=clblue;
  end;
end;

procedure TFrm_detail.Edit5Exit(Sender: TObject);
begin
 if activecontrol.Name<>'BitBtn7' then
 try
  form_unit := Tform_unit.Create(Application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;
  form_unit.Edit1.Text:=trim(edit5.Text);
 if comparetext(trim(edit5.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
  begin
   edit5.Font.Color:=clwindowtext;
   label39.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
   label41.Caption := edit5.Text;
   label44.Caption := edit5.Text;
   dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
    dm.AQ17STOCK_PURCH.Value:=1;
  end
 else
  begin
   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label39.Caption:='';
   edit5.SetFocus;
  end;
 finally
  form_unit.free;
 end;
end;

procedure TFrm_detail.Edit6Exit(Sender: TObject);
begin
 if activecontrol.Name<>'BitBtn8' then
 try
  form_unit := Tform_unit.Create(Application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;
  form_unit.Edit1.Text:=trim(edit6.Text);
 if comparetext(trim(edit6.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
  begin
   edit6.Font.Color:=clwindowtext;
   label42.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
   label43.Caption := edit6.Text;
   label40.Caption := edit6.Text;
   dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
    dm.AQ17STOCK_PURCH.Value:=1;
  end
 else
  begin
   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label42.Caption:='';
   edit6.SetFocus;
  end;
 finally
  form_unit.free;
 end;
end;

procedure TFrm_detail.Edit6Click(Sender: TObject);
begin
 if edit6.Font.Color=clwindowtext then
  begin
   edit6.SelectAll;
   edit6.Font.Color :=clblue;
  end;
end;

procedure TFrm_detail.ComboBox1Change(Sender: TObject);
begin
 case combobox1.ItemIndex of
  0:dm.AQ17S_B_N.Value:='S';
  1:dm.AQ17S_B_N.Value:='B';
  2:dm.AQ17S_B_N.Value:='N';
 end;
end;

procedure TFrm_detail.BitBtn10Click(Sender: TObject);
begin
 try
  form_account:=tform_account.Create(application); // 总帐帐目
  form_account.Edit1.Text :=trim(edit7.Text);
  if form_account.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit7.SetFocus;
   end
  else
   if form_account.ShowModal=mrok then
    begin
     edit7.Text := form_account.ADOQuery1.FieldValues['gl_acc_number'];
     edit7.Font.Color := clwindowtext;
     label33.Caption := form_account.ADOQuery1.FieldValues['gl_description'];
     dm.AQ17G_L_CODE_SELL_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
     dbedit8.SetFocus;
    end
   else
    edit7.SetFocus;
 finally
  form_account.free;
 end;
end;

procedure TFrm_detail.Edit7Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn10') and (trim(edit7.Text)<>'') then
 try
  form_account := Tform_account.Create(Application);
  form_account.Edit1.Text:=trim(edit7.Text);
 if comparetext(trim(edit7.text),trim(form_account.ADOQuery1.Fieldbyname('gl_acc_number').AsString))=0 then
  begin
   edit7.Font.Color:=clwindowtext;
   label33.Caption:=form_account.ADOQuery1.FieldValues['gl_description'];
   dm.AQ17G_L_CODE_SELL_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('帐目代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label33.Caption := '';
   edit7.SetFocus;
  end;
 finally
  form_account.free;
 end
else
 if (activecontrol.Name<>'BitBtn10') and (trim(edit7.Text)='') then
  begin
   dm.AQ17G_L_CODE_SELL_PTR.AsVariant :=null;
   label33.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TFrm_detail.Edit7Click(Sender: TObject);
begin
if edit7.Font.Color=clwindowtext then
 begin
  edit7.SelectAll;
  edit7.Font.Color :=clblue;
 end;
end;

procedure TFrm_detail.Edit8Click(Sender: TObject);
begin
 if edit8.Font.Color=clwindowtext then
  begin
   edit8.SelectAll;
   edit8.Font.Color :=clblue;
  end;
end;

procedure TFrm_detail.Edit8Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn11') and (trim(edit8.Text)<>'') then
 try
  form_account := Tform_account.Create(Application);
  form_account.Edit1.Text:=trim(edit8.Text);
 if comparetext(trim(edit8.text),trim(form_account.ADOQuery1.Fieldbyname('gl_acc_number').AsString))=0 then
  begin
   edit8.Font.Color:=clwindowtext;
   label34.Caption:=form_account.ADOQuery1.FieldValues['gl_description'];
   dm.AQ17G_L_CODE_BUY_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('帐目代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label34.Caption := '';
   edit8.SetFocus;
  end;
 finally
  form_account.free;
 end
else
 if (activecontrol.Name<>'BitBtn11') and (trim(edit8.Text)='') then
  begin
   dm.AQ17G_L_CODE_buy_PTR.AsVariant :=null;
   label34.Caption:='';
  end;
 statusbar1.SimpleText :='';
end;

procedure TFrm_detail.BitBtn11Click(Sender: TObject);
begin
 try
  form_account:=tform_account.Create(application);
  form_account.Edit1.Text :=trim(edit8.Text);
  if form_account.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit8.SetFocus;
   end
  else
   if form_account.ShowModal=mrok then
    begin
     edit8.Text := form_account.ADOQuery1.FieldValues['gl_acc_number'];
     edit8.Font.Color := clwindowtext;
     label34.Caption := form_account.ADOQuery1.FieldValues['gl_description'];
     dm.AQ17G_L_CODE_buy_PTR.Value := form_account.ADOQuery1.FieldValues['rkey'];
     treeview1.SetFocus;
    end
   else
    edit8.SetFocus;
 finally
  form_account.free;
 end;

end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
var
i:byte;
begin
 try
  form_note:=tform_note.Create(application);   //   记事本代码
  if form_note.ShowModal=mrok then
   begin
   memo1.Clear;
   for i:=1 to 4 do
   memo1.lines.add(form_note.Adoquery1.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
   end;
 finally
  form_note.free;
 end;
end;

procedure TFrm_detail.Memo1Change(Sender: TObject);
begin
 if memo1.Lines.Count>=4 then
  memo1.WantReturns :=false
 else
  memo1.WantReturns :=true;
end;

procedure TFrm_detail.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if (key = chr(46)) then
   if pos('.',TEdit(sender).Text)>0 //小数点不能重复
    then abort;
end;

procedure TFrm_detail.Edit9Exit(Sender: TObject);
begin
 if trim(Tedit(sender).Text)='' then Tedit(sender).Text:='0';
  Tedit(sender).Text := formatfloat('0.00',strtofloat(Tedit(sender).Text));
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
 if treeview2.Items.Count<>0 then
 begin
  case TREEView2.Selected.Level of
  0: begin
      n1.Visible:=true;
      n2.Visible:=true;
     end;
  1: begin
      n1.Visible:=false;
      n2.Visible:=false;
     end;
  end;
 end else begin
  n1.Visible:=true;
  n2.Visible:=false;

 end;
end;

procedure TFrm_detail.N1Click(Sender: TObject);
var
 NODE:TTREENODE;
 i:integer;
 InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields:= 'INV_PART_NUMBER/材料编码/110,INV_NAME/材料名称/251,INV_DESCRIPTION/材料规格/251';
    InputVar.Sqlstr:=
//      'Select RKEY,INV_PART_NUMBER,INV_NAME,ANALYSIS_CODE5,INV_DESCRIPTION+ANALYSIS_CODE4 as INV_DESCRIPTION'+#13+
      'Select RKEY,INV_PART_NUMBER,INV_NAME,INV_DESCRIPTION,ANALYSIS_CODE5'+#13+
      'From Data0017 Where Rkey<>'+dm.AQ17RKEY.AsString+#13+
      'Order By INV_PART_NUMBER';
    inputvar.InPut_value:='';
    inputvar.KeyField:='INV_PART_NUMBER';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      with frmPick_Item_Single.adsPick do
      begin
        if treeview2.items.count>0 then  //如果treeveiw控件已有数据
        begin
          For i:=0 to Treeview2.items.count-1 do
          if TREEVIEW2.ITEMS[i].text=FIELDBYNAME('INV_PART_NUMBER').ASSTRING+' '+FIELDBYNAME('INV_NAME').ASSTRING then
          begin
            Messagedlg('该材料已经存在!',mtinformation,[mbOK],0);
            exit;
          end;
          node:=treeview2.Selected;
          if node.Parent=nil then
            NODE:=TREEVIEW2.Items.Add(node,FIELDBYNAME('INV_PART_NUMBER').ASSTRING+' '+FIELDBYNAME('INV_NAME').ASSTRING)
          else
            NODE:=TREEVIEW2.Items.Add(node.parent,FIELDBYNAME('INV_PART_NUMBER').ASSTRING+' '+FIELDBYNAME('INV_NAME').ASSTRING);
          node.ImageIndex:=0;
          node.SelectedIndex:=0;
          node.Selected:=true;
        end
        else
        begin
          NODE:=TREEVIEW2.Items.AddFirst(treeview2.selected,FIELDBYNAME('INV_PART_NUMBER').ASSTRING+' '+FIELDBYNAME('INV_NAME').ASSTRING);
          node.ImageIndex:=0;
          node.SelectedIndex:=0;
          node.Selected:=true;
        end;
        dm.AQ18.Append;
        dm.AQ18invent_ptr.Value:=0;  //DM.AQ17.FIELDvalues['RKEY'];
        dm.AQ18alterINVENT_PTR_PTR.Value:=FIELDvalues['RKEY'];
        dm.AQ18.Post;
        treeview2.FullExpand;
      end;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrm_detail.N3Click(Sender: TObject);
//var
//node:ttreenode;
//i:integer;
begin
//node:=treeview2.Selected;
//IF node.Parent<>nil THEN
//   NODE:=node.parent;
//if node.Count = 5 then //交节点下的子节点数目不能多于5个
// begin
//  showmessage('仓库位置已满5个不能再增加了！');
// end
//else
//try
//  form_lo := Tform_lo.Create(Application);
//  if form_lo.ShowModal=mrok then
//   begin
//    if node.Count>0 then  //如果有子节点那幺就去找位置是否重复
//      For i:=0 to node.count-1 do
//       if node.ITEM[i].text=form_lo.ADOQuery1.FIELDBYNAME('code').ASSTRING+' '+form_lo.ADOQuery1.FIELDBYNAME('location').ASSTRING
//        then
//         begin  //如果子节点的文本已存在
//          Messagedlg('仓库位置已经存在!',mtinformation,[mbOK],0);
//          exit;
//         end;
//
//     node:=treeview2.Items.AddChild(node,form_lo.ADOQuery1.fieldbyname('code').asstring+' '+form_lo.ADOQuery1.fieldbyname('location').asstring);
//     node.ImageIndex:=1;
//     node.SelectedIndex:=1;
//   dm.AQ18.Edit;
//   dm.AQ18.fieldvalues['location_ptr'+inttostr(node.parent.Count)]:=form_lo.ADOQuery1.fieldvalues['rkey'];
//   dm.AQ18.Post;
//    node.Selected:=true;
//    treeview2.FullExpand;
// end;
//finally
//form_lo.free;
//end;

end;

procedure TFrm_detail.TreeView2Change(Sender: TObject; Node: TTreeNode);
//var
// searchoption:tlocateoptions;
begin
//  searchoption:=[lopartialkey]; //查找data0018仓库数据
//  if node.Parent<>nil then  //如果不在第一层
//  begin
//    node:=node.Parent;
//    dm.aq15.locate('WAREHOUSE_CODE',copy(node.text,1,pos(' ',node.text)-1),searchoption);
//    dm.AQ18.locate('WHOUSE_PTR',dm.aq15.fieldbyname('RKEY').ASINTEGER,searchoption);
//    label46.Font.Color:=clgray;
//    label47.font.color:=clgray;
//    label48.font.color:=clgray;
//    dbedit19.Enabled:=false;
//    dbedit20.Enabled:=false;
//    dbedit21.Enabled:=false;
//  end
//  else                      //如果在第一层
//  begin
//    dm.aq15.locate('WAREHOUSE_CODE',copy(node.text,1,pos(' ',node.text)-1),searchoption);
//    dm.AQ18.locate('WHOUSE_PTR',dm.aq15.fieldbyname('RKEY').ASINTEGER,searchoption);
//    label46.Font.Color:=clwindowtext;
//    label47.font.color:=clwindowtext;
//    label48.font.color:=clwindowtext;
//    dbedit19.Enabled:=true;
//    dbedit20.Enabled:=true;
//    dbedit21.Enabled:=true;
//  end;
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var
 node :ttreenode;
begin
  dm.AQ18.Delete;
  node:=treeview2.Selected;
  node.Delete;
end;

procedure TFrm_detail.N4Click(Sender: TObject);
//var
// node:ttreenode;
// i:integer;
begin
// node:=treeview2.Selected;
// dm.AQ18.Edit;
// if node.index=node.Parent.count-1 then //如果是删除最后一个仓库位置
//  begin
//  dm.AQ18.FieldValues['location_ptr'+inttostr(node.parent.Count)]:=null;
//  dm.AQ18.Post;
//  node.Delete;
//  end
// else             //如果是删除中间仓库位置
//  begin
//   for i:=node.index+1 to node.Parent.Count do
//    begin
//     if i < node.Parent.Count then
//      dm.AQ18.fieldvalues['location_ptr'+inttostr(i)]:=dm.AQ18.FieldValues['location_ptr'+inttostr(i+1)]
//     else
//      dm.AQ18.FieldValues['location_ptr'+inttostr(i)]:=null;
//    end;
//  dm.AQ18.Post;
//  node.delete;
// end;
end;

procedure TFrm_detail.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if (acol=2) and (arow=stringgrid1.RowCount-1) then
   canselect:=false;
end;

procedure TFrm_detail.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if stringgrid1.RowCount=2 then  abort;
 if length(stringgrid1.Cells[1,stringgrid1.row])>=15 then
 if key<>#8 then
  abort; //最多输入15个字符
end;

procedure TFrm_detail.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then dm.AQ17.Cancel;// 非正常退出
 dm.AQ18.Close;
 dm.AQ1711.Close;
 dm.Aq0023.Close;
 dm.AQ15.Close;
end;

procedure TFrm_detail.dbbox_visible;
var i:integer;
begin
  for i:=1 to dm.AQ0499.RecordCount do
    self.Panel1.FindChildControl('DBComboBox'+inttostr(i)).Visible:=true;
end;

procedure TFrm_detail.dbbox_additem(i:byte);
var
  LCBX: TDBComboBox;
begin
with dm.tmp do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey,tvalue from data0338');
  sql.Add('where parameter_ptr='+dm.AQ0499PARAMETER_PTR.AsString);
  SQL.Add(' order by tvalue asc');
  open;
  case i of
     1: LCBX := DBComboBox1;
     2: LCBX := DBComboBox2;
     3: LCBX := DBComboBox3;
     4: LCBX := DBComboBox4;
     5: LCBX := DBComboBox5;
     6: LCBX := DBComboBox6;
     7: LCBX := DBComboBox7;
     8: LCBX := DBComboBox8;
     9: LCBX := DBComboBox9;
     10: LCBX := DBComboBox10;
  else
    LCBX := DBComboBox1;
  end;
  //A22F16010400480-NNRC
  while not eof do         //csOwnerDrawFixed
   begin
//     LCBX.Style := csDropDown;
     LCBX.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
     if trim(dm.tmp.fieldvalues['tvalue']) = Trim(DM.AQ17.fieldbyname('IES_PARAMETER_VALUE' + IntToStr(i)).AsString) then
        LCBX.ItemIndex := LCBX.Items.Count -1;
//    case i of
//     1:
//     begin
//      DBComboBox1.Style := csDropDownList;
//      dbcombobox1.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      if trim(dm.tmp.fieldvalues['tvalue']) = DM.AQ17IES_PARAMETER_VALUE1.Value then
//        DBComboBox1.ItemIndex := DBComboBox1.Items.Count - 1;
//
//     end;
//     2:
//     begin
//      dbcombobox2.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      DBComboBox2.Style := csDropDownList;
//      if trim(dm.tmp.fieldvalues['tvalue']) = DM.AQ17IES_PARAMETER_VALUE2.Value then
//        DBComboBox2.ItemIndex := DBComboBox2.Items.Count - 1;
//     end;
//     3:
//     begin
//      dbcombobox3.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      DBComboBox3.Style := csDropDownList;
//      if trim(dm.tmp.fieldvalues['tvalue']) = DM.AQ17IES_PARAMETER_VALUE3.Value then
//        DBComboBox3.ItemIndex := DBComboBox3.Items.Count - 1;
//     end;
//     4:
//     begin
//     dbcombobox4.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      DBComboBox4.Style := csDropDownList;
//     end;
//     5:
//     begin
//       dbcombobox5.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//        //DBComboBox5.Style := csDropDownList;
//     end;
//     6:
//     begin
//     dbcombobox6.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      //DBComboBox6.Style := csDropDownList;
//     end;
//     7:
//     begin
//     dbcombobox7.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      //DBComboBox7.Style := csDropDownList;
//     end;
//     8:
//     begin
//     dbcombobox8.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      //DBComboBox8.Style := csDropDownList;
//     end;
//     9:
//     begin
//     dbcombobox9.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      //DBComboBox9.Style := csDropDownList;
//     end;
//     10:
//     begin
//     dbcombobox10.Items.Add(trim(dm.tmp.fieldvalues['tvalue']));
//      //DBComboBox10.Style := csDropDownList;
//     end;
//    end;
    next;
   end;
 end;

end;

procedure TFrm_detail.update_note;
begin
  if comparetext(trim(inv_part_number),trim(dm.AQ17INV_PART_NUMBER.Value))<>0 then
  with dm.tmp do
  begin
    close;
    sql.text:='insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,'+
              'FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)'+
              'values ('+dm.AQ17RKEY.AsString+',5,''更改材料项目编号'','+
              ''''+inv_part_number+''','''+dm.AQ17INV_PART_NUMBER.Value+''','+rkey73+','+
              'getdate(),89)';
    ExecSQL;
  end;
  if comparetext(trim(INV_NAME),trim(dm.AQ17INV_NAME.Value))<>0 then
  with dm.tmp do
  begin
    close;
    sql.text:='insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,'+
              'FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)'+
              'values ('+dm.AQ17RKEY.AsString+',6,''更改材料项目名称'','+
              ''''+INV_NAME+''','''+dm.AQ17INV_NAME.Value+''','+rkey73+','+
              'getdate(),89)';
    ExecSQL;
  end;
  if comparetext(trim(INV_DESCRIPTION),trim(dm.AQ17INV_DESCRIPTION.Value))<>0 then
  with dm.tmp do
  begin
    close;
    sql.Text:='insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,'+
              'FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE) '+
              'values ('+dm.AQ17RKEY.AsString+',7,''更改材料项目规格'','+
              ''''+INV_DESCRIPTION+''','''+dm.AQ17INV_DESCRIPTION.Value+''','+rkey73+','+
              'getdate(),89)';

    ExecSQL;
  end;
if comparetext(trim(CONSIGN_ONHAND_QTY),trim(dm.AQ17CONSIGN_ONHAND_QTY.AsString))<>0 then
  with dm.tmp do
  begin
    close;
    sql.Text:='insert into data0318 (INVENTORY_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,'+
              'FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE) '+
              'values ('+dm.AQ17RKEY.AsString+',8,''更改材料项目安全库存'','+
              ''''+CONSIGN_ONHAND_QTY+''','''+dm.AQ17CONSIGN_ONHAND_QTY.AsString+''','+rkey73+','+
              'getdate(),89)';

    ExecSQL;
  end; 

end;

function TFrm_detail.svValid: boolean;
var i,k:Integer;
begin
  result:=false;
  if trim(dbedit3.Text)='' then
  begin
   messagedlg('材料代码不能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   dbedit3.SetFocus;
   exit;
  end;
  if trim(dbedit4.Text)='' then
  begin
   messagedlg('材料名称不能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   dbedit4.SetFocus;
   exit;
  end;
  if trim(dbedit9.Text)='' then
  begin
   messagedlg('材料规格不能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   dbedit9.SetFocus;
   exit;
  end;

  if trim(edit1.Text)='' then
  begin
   messagedlg('材料类别能为空!',mtwarning,[mbok],0);
   treeview1.Items[1].Selected := true;
   edit1.SetFocus;
   exit;
  end;
//==============================================================================

 //2018-8-7tang--------------
   k:=1;
   if (flag496=3) and (Rkey595<>'') then
   begin
      for i := 1 to Panel1.ControlCount-1 do
      begin
        if Panel1.Controls[i].Tag>=11 then
        begin
          if ((TComboBox(Panel1.Controls[i]).Text)='') and (k<StringGrid2.RowCount-1) then
          begin
            ShowMessage('该材料是规则输入方式，请确定规则完整！');
            exit;
          end;
          k:=k+1;
        end;
      end;
   end;

//20171108tang---
  if Shelf_life >0 then
  begin
    if (Trim(DBEdit10.Text) = '0') or (Trim(DBEdit10.Text) = '')  then
    begin
      messagedlg('保质期必须大于0天!',mterror,[mbcancel],0);
      Notebook1.PageIndex:=3;
      dbedit10.SetFocus;
      Exit;
    end;
  end;
//end20171108tang---

 if (dm.AQ17STOCK_UNIT_PTR.Value<>dm.AQ17PURCH_UNIT_PTR.Value) and
  (dbedit7.Field.Value<=0) then
   begin
    messagedlg('存货/采购转换率输入不正确,不能为零',mtinformation,[mbcancel],0);
    treeview1.Items[2].Selected := true;
    dbedit7.SetFocus;
    exit;
   end;
   result:=true;
end;

procedure TFrm_detail.init;
var
 i:byte;
 node :ttreenode;
begin
  inv_part_number:=dm.AQ17inv_part_number.AsString;
  INV_NAME:=dm.AQ17INV_NAME.AsString;
  INV_DESCRIPTION:=dm.AQ17INV_DESCRIPTION.AsString;
  CONSIGN_ONHAND_QTY:=DM.aq17CONSIGN_ONHAND_QTY.AsString;
  //==============================================================================
  if dm.AQ17GROUP_PTR.AsVariant<>null then
  with dm.tmp do   //查找材料类别不能为空
   begin
    close;
    sql.Clear;
    sql.Add('select group_name,group_desc,ttype,isnull(SHELF_LIFE,0) as SHELF_LIFE');
    sql.Add('from data0496 where rkey='+dm.AQ17GROUP_PTR.AsString);
    open;
    edit1.Text := FieldValues['group_name'];;
    edit1.Font.Color := clwindowtext;
    label35.Caption := FieldValues['group_desc'];
    label62.Caption:='默认值:'+fieldbyname('SHELF_LIFE').AsString;
    self.SHELF_LIFE:=fieldbyname('SHELF_LIFE').AsInteger;
    if fieldvalues['ttype']='P' then
     ctype.Caption:='直接材料'
    else
     ctype.Caption:='间接材料';

   end;
  //==============================================================================
  if dm.AQ17AUTHORIZED_BUYER_PTR.AsVariant<>null then
  with dm.tmp do   //查找采购员
   begin
    close;
    sql.Clear;
    sql.Add('select empl_code,employee_name from data0005');
    sql.Add('where rkey='+dm.AQ17AUTHORIZED_BUYER_PTR.AsString);
    open;
    edit3.Text := FieldValues['empl_code'];;
    edit3.Font.Color := clwindowtext;
    label37.Caption := FieldValues['employee_name'];
   end;
  //==============================================================================
  if dm.AQ17PREF_SUPPLIER_PTR.AsVariant<>null then
  with dm.tmp do   //查找首选供应商
   begin
    close;
    sql.Clear;
    sql.Add('select code,supplier_name from data0023');
    sql.Add('where rkey='+dm.AQ17PREF_SUPPLIER_PTR.AsString);
    open;
    edit4.Text := FieldValues['code'];;
    edit4.Font.Color := clwindowtext;
    label38.Caption := FieldValues['supplier_name'];
   end;
  //==============================================================================
  if dm.AQ17G_L_CODE_BUY_PTR.AsVariant<>null then
  with dm.tmp do
   begin
    close;
    sql.Clear;
    sql.Add('select gl_acc_number,gl_description from data0103');
    sql.Add('where rkey='+dm.AQ17G_L_CODE_BUY_PTR.AsString);
    open;
    if not isempty then
     begin
      edit8.Text := trim(FieldValues['gl_acc_number']);;
      label34.Caption := trim(FieldValues['gl_description']);
     end;
   end;

  if dm.AQ17PURCH_UNIT_PTR.AsVariant<>null then
  with dm.tmp do
   begin
    close;
    sql.Text:='SELECT UNIT_CODE, UNIT_NAME from data0002 where rkey='+dm.AQ17PURCH_UNIT_PTR.AsString;
    open;
    edit5.Text := FieldValues['UNIT_CODE'];;   //查找采购单位,不为空
    edit5.Font.Color := clwindowtext;
    label39.Caption :=FieldValues['UNIT_NAME'];
    label41.Caption := edit5.Text;
    label44.Caption := edit5.Text;
   end;

  if dm.AQ17STOCK_UNIT_PTR.AsVariant<>null then
  with dm.tmp do
  begin
    close;
    sql.Text:='SELECT UNIT_CODE, UNIT_NAME from data0002 where rkey='+dm.AQ17STOCK_UNIT_PTR.AsString;
    open;
  //==============================================================================
    edit6.Text := FieldValues['unit_code'];  //查找存货单位,不为空
    edit6.Font.Color := clwindowtext;
    label42.Caption := FieldValues['unit_name'];
    label43.Caption := edit6.Text;
    label40.Caption := edit6.Text;
  end;
//-----------------
  if (Trim(dm.AQ17CATALOG_NUM.AsString)='Y') then
     CheckBox1.Checked:=True
  else
    CheckBox1.Checked:=False;
  //==============================================================================
  with dm.AQ1711 do                        //读取记事本
  begin
    close;
    Parameters[0].Value:=dm.AQ17RKEY.Value;
    open;
    if not IsEmpty then
    for i:=1 to 4 do
      memo1.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
  end;
  //==============================================================================
  dm.AQ15.Open;
  if FEdtState='Cop' then
  begin
    dm.AQ18.Close;                     
    dm.AQ18.Parameters[0].Value := null;
    dm.AQ18.Open;
  end;
  if FEdtState<>'Cop' then
  begin
    dm.AQ18.Close;                      //替料查找
    dm.AQ18.Parameters[0].Value := dm.AQ17RKEY.Value;
    dm.AQ18.Open;
    dm.AQ18.First;
   while not dm.AQ18.Eof do
   begin
     with dm.tmp do
     begin
       close;
       sql.Clear;
       sql.Add('select INV_PART_NUMBER,INV_NAME,ANALYSIS_CODE5 from data0017');
       sql.Add('where rkey='+dm.AQ18alterINVENT_PTR_PTR.AsString);
       active:=true;
       node :=TREEVIEW2.Items.ADD(treeview2.Selected,fieldvalues['INV_PART_NUMBER']+' '+fieldvalues['INV_NAME']);
       node.ImageIndex:=0;
       node.SelectedIndex:=0;
     end;
   
     dm.AQ18.Next;
   end;
   dm.AQ18.First;
   treeview2.FullExpand;
  end;
  if (flag496=3) and (Rkey595<>'') then
  begin
    StringGrid1.Visible:=False;
    StringGrid2.Visible:=True;
    StringGrid2.ColWidths[4]:=-1;
    StringGrid2.ColWidths[5]:=-1;
    StringGrid2.ColWidths[6]:=-1;
    StringGrid2.ColWidths[7]:=-1;
    DBEdit3.Enabled:=False;
    DBEdit9.Enabled:=False;
    init2(Rkey595);
  end else
  begin
    StringGrid1.Visible:=True;
    StringGrid2.Visible:=False;
    DBEdit3.Enabled:=True;
    DBEdit9.Enabled:=True;
  //==============================================================================
   stringgrid1.Cells[0,0] := '参数代码';
   stringgrid1.Cells[1,0] := '参数名称';
   stringgrid1.Cells[2,0] := '值';
   StringGrid1.Cells[3,0] := '单位';
   if FEdtState='Cop' then
   begin
     dm.aq0499.DataSource:=nil;
     dm.aq0499.Parameters[0].Value:=dm.AQ17.fieldvalues['group_ptr'];
   end;
   dm.aq0499.open;
  if not dm.AQ0499.IsEmpty then
   begin
    dm.AQ0499.first;
    stringgrid1.RowCount := dm.AQ0499.RecordCount+1;
    dbbox_visible;
    for i:=1 to dm.AQ0499.RecordCount do
    begin
      stringgrid1.Cells[0,i] := dm.AQ0499PARAMETER_NAME.AsString;
      stringgrid1.Cells[1,i] := dm.AQ0499PARAMETER_desc.Value;

      {if FEdtState='Add' then //新增包括复制
      begin
      //DM.AQ17.Edit;
      dm.AQ17.Fieldvalues['IES_PARAMETER_VALUE'+inttostr(i)]:=dm.AQ0499DEF_VALUE.Value;
      end;} 
      dbbox_additem(i);   //给每一个参数增加可选项目

       if FEdtState='Add'  then
        begin
        DBComboBox1.ItemIndex:=Frm_New.ComboBox1.ItemIndex;
        DBComboBox2.ItemIndex:=Frm_New.ComboBox2.ItemIndex;
        DBComboBox3.ItemIndex:=Frm_New.ComboBox3.ItemIndex;
        DBComboBox4.ItemIndex:=Frm_New.ComboBox4.ItemIndex;
        DBComboBox5.ItemIndex:=Frm_New.ComboBox5.ItemIndex;
        DBComboBox6.ItemIndex:=Frm_New.ComboBox6.ItemIndex;
        DBComboBox7.ItemIndex:=Frm_New.ComboBox7.ItemIndex;
        DBComboBox8.ItemIndex:=Frm_New.ComboBox8.ItemIndex;
        DBComboBox9.ItemIndex:=Frm_New.ComboBox9.ItemIndex;
        DBComboBox10.ItemIndex:=Frm_New.ComboBox10.ItemIndex;
        end;
      StringGrid1.Cells[3,i] := DM.AQ0499UNIT_NAME.AsString;
      dm.AQ0499.Next;

    end;
   end;
   if dm.aq0499.DataSource=nil then dm.aq0499.DataSource:=dm.DataSource1;
   dm.AQ0499.Close;
  end;
  //==============================================================================

   treeview1.FullExpand;
   treeview1.Items[1].Selected := true;

   if dm.AQ17S_B_N.Value='S' then
    combobox1.ItemIndex :=0
   else if dm.AQ17S_B_N.Value='B' then
     combobox1.ItemIndex :=1
   else
     combobox1.ItemIndex :=2;

//201406-------------------
   if dm.AQ17MODIFY_ENGG_RTE_CODE.Value='A' then
    combobox2.ItemIndex :=0
   else if dm.AQ17MODIFY_ENGG_RTE_CODE.Value='B' then
     combobox2.ItemIndex :=1
   else if dm.AQ17MODIFY_ENGG_RTE_CODE.Value='C' then
     combobox2.ItemIndex :=2
   else if dm.AQ17MODIFY_ENGG_RTE_CODE.Value='D' then
     combobox2.ItemIndex :=3
   else if dm.AQ17MODIFY_ENGG_RTE_CODE.Value='E' then
     combobox2.ItemIndex :=4;
//end 201406---------------

//20171103tang 加
   if (DM.AQ17SHELF_LIFE.Value=0) then
   begin
     //2018-10-09tang改重新判断
     if (dm.AQ17SHELF_LIFE.Value=DM.aq17shelf2.Value) then
     begin
     DBEdit10.Enabled := False;
     Label62.Visible := False;
     end;
   end else
   begin
     DBEdit10.Enabled := True;
     Label62.Visible := True;
   end;

   if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   begin
      DBEdit3.ReadOnly := true;
      DBEdit3.Color := cl3dlight;
      DBEdit4.ReadOnly := true;
      DBEdit4.Color := cl3dlight;
      DBEdit9.ReadOnly := true;
      DBEdit9.Color := cl3dlight;
   end;
   if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
     self.Panel1.Enabled:=false;
   if  (strtoint(vprev)=3) or (strtoint(vprev)=4) then
   dm.Aq0023.Open;
   BtnSave.Enabled:=not (FEdtState='Look');
end;

procedure TFrm_detail.FormShow(Sender: TObject);
begin
   init;
   if DBCheckBox5.Checked <> True then
    DBCheckBox5.Checked:=False;

   if DBCheckBox3.Checked <> True then
    DBCheckBox3.Checked:=False;

   if CheckBox1.Checked <> True then
      CheckBox1.Checked:=False;

//20171103tang注
//   if StrToInt(Trim(DBEdit10.Text)) <= 0 then
//   begin
//     DBEdit10.Enabled := False;
//     Label62.Visible := False;
//   end;
end;

procedure TFrm_detail.Notebook1PageChanged(Sender: TObject);
begin
   Notebook1.Enabled:=((FEdtState='Look') and (Notebook1.PageIndex=4)) or (FEdtState<>'Look');
end;

function TFrm_detail.mask_value(inv_number: string): string;
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

function TFrm_detail.Power(x, y: extended): extended;
begin
  result := exp(y*ln(x));
end;

procedure TFrm_detail.ComboBox2Change(Sender: TObject);
begin
 case ComboBox2.ItemIndex of
  0:dm.AQ17MODIFY_ENGG_RTE_CODE.Value:='A';
  1:dm.AQ17MODIFY_ENGG_RTE_CODE.Value:='B';
  2:dm.AQ17MODIFY_ENGG_RTE_CODE.Value:='C';
  3:dm.AQ17MODIFY_ENGG_RTE_CODE.Value:='D';
  4:dm.AQ17MODIFY_ENGG_RTE_CODE.Value:='E';
 end;
end;

procedure TFrm_detail.btn1Click(Sender: TObject);
begin
  try
    form_invtype:=tform_invtype.Create(application);
    //form_invtype.Edit1.Text :=trim(edit1.Text);
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
       label35.Caption := form_invtype.ADOQuery1GROUP_DESC.Value;
       edit1.Tag:= form_invtype.ADOQuery1RKEY.Value;
       DM.AQ17GROUP_PTR.AsInteger := form_invtype.ADOQuery1RKEY.Value;
       //ctype.Caption := form_invtype.ADOQuery1ctype.Value;
//       if form_invtype.ADOQuery1if_flag.Value=0 then //掩码
//          MaskEdit1.EditMask:=form_invtype.ADOQuery1mask_inv_number.Value
//       else
//       if form_invtype.ADOQuery1if_flag.Value=1 then //更改if_flag =1（作为初始值）的处理情况
//        begin
//          MaskEdit1.EditMask :='';
//          MaskEdit1.Text := form_invtype.ADOQuery1mask_inv_number.Value;
//        end
//       else                                      //手动
//       if form_invtype.ADOQuery1if_flag.Value=2 then  //新增if_flag=2(手工输入)的处理情况
//        begin
//          MaskEdit1.EditMask :='';
//          MaskEdit1.Text := '';
//        end;
//       MaskEdit1.SetFocus;
    end
    else
      edit1.SetFocus;
 finally
   form_invtype.free;
 end;
end;



procedure TFrm_detail.ComboBox3Change(Sender: TObject);
var i:integer;
    strcb,strtxt:string;
begin
  strtxt:='';
  for i:=1 to StringGrid2.RowCount-1 do
  begin
    strcb:=Trim(StringGrid2.Cells[2,i]);
    strtxt:=strtxt+strcb+' ';
  end;
  DM.AQ17INV_DESCRIPTION.Value:=TrimLeft(strtxt);
  ComboBox13.ItemIndex:=ComboBox3.ItemIndex;
  strtxt:='';
  for i:=1 to StringGrid2.RowCount-1 do
  begin
    strcb:=Trim(StringGrid2.Cells[5,i]);
    strtxt:=strtxt+strcb;
  end;
  DM.AQ17INV_PART_NUMBER.Value:=TrimLeft(strtxt);
end;

procedure TFrm_detail.ComboBox3Exit(Sender: TObject);
var sl:string;
begin
//2018-07-31tang
    ComboBox4.Visible:=True;
    sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,2]);
    Additem(sl,ComboBox4,ComboBox14);
    if (Trim(ComboBox3.Text)<>Trim(StringGrid2.Cells[2,1])) then
    begin
      StringGrid2.Cells[2,1]:= ComboBox3.Text;
      StringGrid2.Cells[5,1]:=ComboBox13.Text;
      ComboBox3Change(nil);
//    end else
//    begin
//      if (ComboBox4.Items.IndexOf(Trim(StringGrid2.Cells[2,2]))=-1) then
//        ComboBox4.Text:=Trim(StringGrid2.Cells[2,1])
//      else
    end;
      ComboBox4.ItemIndex:=ComboBox4.Items.IndexOf(Trim(StringGrid2.Cells[2,2]));
end;

procedure TFrm_detail.ComboBox4Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
    ComboBox5.Visible:=True;
    if (trim(StringGrid2.Cells[6,3])<>'')then
    begin
      sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,3])+' and filter_name='''+ComboBox4.Text+'''';
    end else sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,3]);
    Additem(sl,ComboBox5,ComboBox15);
    if (Trim(ComboBox4.Text)<>Trim(StringGrid2.Cells[2,2])) then
    begin
      StringGrid2.Cells[2,2]:=ComboBox4.Text;
      StringGrid2.Cells[5,2]:=ComboBox14.Text;
      ComboBox3Change(nil);
    end;
      ComboBox5.ItemIndex:=ComboBox5.Items.IndexOf(Trim(StringGrid2.Cells[2,3]));
end;

procedure TFrm_detail.ComboBox5Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
    ComboBox6.Visible:=True;
    if (trim(StringGrid2.Cells[6,4])<>'') then
    begin
      sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,4])+' and filter_name='''+ComboBox5.Text+'''';
    end else sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,4]);
    Additem(sl,ComboBox6,ComboBox16);
    if (Trim(ComboBox5.Text)<>Trim(StringGrid2.Cells[2,3])) then
    begin
      StringGrid2.Cells[2,3]:=ComboBox5.Text;
      StringGrid2.Cells[5,3]:= ComboBox15.Text;
      ComboBox3Change(nil);
    end;
      ComboBox6.ItemIndex:=ComboBox6.Items.IndexOf(Trim(StringGrid2.Cells[2,4]));
end;

procedure TFrm_detail.ComboBox6Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
    ComboBox7.Visible:=True;
    if (trim(StringGrid2.Cells[6,5])<>'') then
    begin
      sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,5])+' and filter_name='''+ComboBox6.Text+'''';
    end else sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,5]);
    Additem(sl,ComboBox7,ComboBox17);
    if (Trim(ComboBox6.Text)<>Trim(StringGrid2.Cells[2,4])) then
    begin
      StringGrid2.Cells[2,4]:=ComboBox6.Text;
      StringGrid2.Cells[5,4]:=ComboBox16.Text;
      ComboBox3Change(nil);
    end;
      ComboBox7.ItemIndex:=ComboBox7.Items.IndexOf(Trim(StringGrid2.Cells[2,5]));
end;

procedure TFrm_detail.ComboBox7Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
    ComboBox8.Visible:=True;
    if (trim(StringGrid2.Cells[6,6])<>'') then
    begin
      sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,6])+' and filter_name='''+ComboBox7.Text+'''';
    end else sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,6]);
    Additem(sl,ComboBox8,ComboBox18);
    if (Trim(ComboBox7.Text)<>Trim(StringGrid2.Cells[2,5])) then
    begin
      StringGrid2.Cells[2,5]:=ComboBox7.Text;
      StringGrid2.Cells[5,5]:=ComboBox17.Text;
      ComboBox3Change(nil);
    end;
      ComboBox8.ItemIndex:=ComboBox8.Items.IndexOf(Trim(StringGrid2.Cells[2,6]));
end;

procedure TFrm_detail.ComboBox8Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
    ComboBox9.Visible:=True;
    if (trim(StringGrid2.Cells[6,7])<>'') then
    begin
      sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,7])+' and filter_name='''+ComboBox8.Text+'''';
    end else sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,7]);
    Additem(sl,ComboBox9,ComboBox19);
    if (Trim(ComboBox8.Text)<>Trim(StringGrid2.Cells[2,6])) then
    begin
      StringGrid2.Cells[2,6]:=ComboBox8.Text;
      StringGrid2.Cells[5,6]:=ComboBox18.Text;
      ComboBox3Change(nil);
    end;
      ComboBox9.ItemIndex:=ComboBox9.Items.IndexOf(Trim(StringGrid2.Cells[2,7]));
end;

procedure TFrm_detail.ComboBox9Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
    ComboBox10.Visible:=True;
    if (trim(StringGrid2.Cells[6,8])<>'')  then
    begin
      itmp:=Pos('(',ComboBox9.Text);
      strcb:=Copy(ComboBox9.Text,1,itmp-1);
      sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,8])+' and filter_name='''+ComboBox9.Text+'''';
    end else sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,8]);
    Additem(sl,ComboBox10,ComboBox20);
    if (Trim(ComboBox9.Text)<>Trim(StringGrid2.Cells[2,7])) then
    begin
      StringGrid2.Cells[2,7]:=ComboBox9.Text;
      StringGrid2.Cells[5,7]:=ComboBox19.Text;
      ComboBox3Change(nil);
    end;
      ComboBox10.ItemIndex:=ComboBox10.Items.IndexOf(Trim(StringGrid2.Cells[2,8]));
end;

procedure TFrm_detail.ComboBox10Exit(Sender: TObject);
var sl,strcb:string;
    itmp:Integer;
begin
//2018-07-31tang
    ComboBox11.Visible:=True;
    if (trim(StringGrid2.Cells[6,9])<>'') then
    begin
      sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,9])+' and filter_name='''+ComboBox10.Text+'''';
    end else sl:='select * from data0594 where rkey593='+trim(StringGrid2.Cells[4,9]);
    Additem(sl,ComboBox11,ComboBox21);
    if (Trim(ComboBox10.Text)<>Trim(StringGrid2.Cells[2,8])) then
    begin
      StringGrid2.Cells[2,8]:=ComboBox10.Text;
      StringGrid2.Cells[5,8]:=ComboBox20.Text;
      ComboBox3Change(nil);
    end;
      ComboBox11.ItemIndex:=ComboBox11.Items.IndexOf(Trim(StringGrid2.Cells[2,9]));
end;

procedure TFrm_detail.ComboBox11Exit(Sender: TObject);
begin
  StringGrid2.Cells[2,9]:=ComboBox11.Text;
  StringGrid2.Cells[5,9]:=ComboBox21.Text;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if (StringGrid1.col= 3) then abort;
end;

procedure TFrm_detail.ComboBox4Change(Sender: TObject);
begin
  ComboBox14.ItemIndex:=ComboBox4.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox5Change(Sender: TObject);
begin
  ComboBox15.ItemIndex:=ComboBox5.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox6Change(Sender: TObject);
begin
  ComboBox16.ItemIndex:=ComboBox6.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox7Change(Sender: TObject);
begin
  ComboBox17.ItemIndex:=ComboBox7.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox8Change(Sender: TObject);
begin
  ComboBox18.ItemIndex:=ComboBox8.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox9Change(Sender: TObject);
begin
  ComboBox19.ItemIndex:=ComboBox9.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox10Change(Sender: TObject);
begin
  ComboBox20.ItemIndex:=ComboBox10.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox11Change(Sender: TObject);
begin
  ComboBox21.ItemIndex:=ComboBox11.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.ComboBox12Change(Sender: TObject);
begin
  ComboBox22.ItemIndex:=ComboBox12.ItemIndex;
  ComboBox3Change(nil);
end;

procedure TFrm_detail.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (gdSelected  in State) then
  begin
    if (ACol = 2 ) and (ARow=1) then
    begin
      ComboBox3.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=2) then
    begin
      ComboBox4.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=3) then
    begin
      ComboBox5.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=4) then
    begin
      ComboBox6.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=5) then
    begin
      ComboBox7.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=6) then
    begin
      ComboBox8.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=7) then
    begin
      ComboBox9.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=8) then
    begin
      ComboBox10.Visible := True;
    end;
    if (ACol = 2 ) and (ARow=9) then
    begin
      ComboBox11.Visible := True;
    end;
  end;
end;

end.
