unit editprodcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, DB, DBTables, ADODB,
  ExtCtrls, Grids, DBGridEh;

type
  TFrm_ProdCode = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Label17: TLabel;
    Label18: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    Label19: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    Edit2: TEdit;
    Label29: TLabel;
    BitBtn5: TBitBtn;
    Label30: TLabel;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit20: TDBEdit;
    Label34: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    Label24: TLabel;
    Label35: TLabel;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    Label25: TLabel;
    Label22: TLabel;
    Edit5: TEdit;
    BitBtn7: TBitBtn;
    Label26: TLabel;
    DBCheckBox3: TDBCheckBox;
    dbgrdh1: TDBGridEh;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit21KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit21Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure dbgrdh1Columns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure dbgrdh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    
    procedure VAutomaticRecode;
  public
    FReviewDays : Integer;
    F_Status:Integer;
    { Public declarations }
  end;

var
   Frm_ProdCode: TFrm_ProdCode;

implementation
uses  demo ,Pick_Item_Single, ConstVar, common;
{$R *.dfm}

procedure TFrm_ProdCode.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'pr_grp_code/产品组代码/150,product_group_name/产品组名称/200';
    InputVar.Sqlstr := 'select rkey,pr_grp_code,product_group_name,REVIEW_DAYS from data0007 where active = 1 order by pr_grp_code ';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.adsPick.IsEmpty then
      messagedlg('请先建立产品组别资料库!',mtinformation,[mbok],0)
    else
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO08.Edit;
      DM.ADO08.FieldByName('PR_GRP_POINTER').Value := frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      DM.ADO08.FieldByName('REVIEW_DAYS').Value := frmPick_Item_Single.adsPick.fieldbyname('REVIEW_DAYS').asinteger;
      DM.ADO08.Post;
      Edit4.Text := frmPick_Item_Single.adsPick.fieldbyname('PR_GRP_CODE').AsString;
      Label25.Caption := frmPick_Item_Single.adsPick.fieldbyname('PRODUCT_GROUP_NAME').AsString;

    end;
    VAutomaticRecode;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrm_ProdCode.BitBtn1Click(Sender: TObject);
begin
  if dbedit12.Text='' then
  begin
    messagedlg('请输入一个正确的产品代码!',mtinformation,[mbok],0);
    dbedit12.SetFocus;
    exit;
  end;
  if dbedit13.Text='' then
  begin
    messagedlg('请输入一个正确的产品名称!',mtinformation,[mbok],0);
    dbedit13.SetFocus;
    exit;
  end;
  if Trim(Edit4.Text)='' then
  begin
    messagedlg('请选择一个正确的产品组类!',mtinformation,[mbok],0);
    bitbtn3.SetFocus;
    exit;
  end;
  if Trim(Edit5.Text)='' then
  begin
    messagedlg('请选择一个正确的类别!',mtinformation,[mbok],0);
    bitbtn7.SetFocus;
    exit;
  end;
  if Trim(ComboBox1.Text)='' then
  begin
    messagedlg('产品阶数不能为空!',mtinformation,[mbok],0);
    ComboBox1.SetFocus;
    exit;
  end;
  if Trim(DBEdit21.Text)='' then
  begin
    messagedlg('层数不能为空!',mtinformation,[mbok],0);
    DBEdit21.SetFocus;
    exit;
  end;
  DM.ADS620.First;
  while not DM.ADS620.Eof do
  begin
    
    if DM.ADS620EST_SCRAP.AsString='' then
    begin
      ShowMessage('报废率不能为空');
      Exit;
    end;
    if dm.ADS620est_scrap_ltm.AsString ='' then
    begin
      ShowMessage('报废率上限不能为空');
      Exit;
    end;
    if DM.ADS620EST_SCRAP.AsInteger > DM.ADS620est_scrap_ltm.AsInteger then
    begin
      ShowMessage('报废率不能低于报废率上限不能为空');
      Exit;
    end;
    dm.ADS620.Next;
  end;

  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Text := 'select rkey,PROD_CODE from data0008 where PROD_CODE='+ QuotedStr(trim(DBEdit12.Text));
    Open;
  end;
  if ((F_Status=1) and (trim(DBEdit12.Text)=DM.ADS08PROD_CODE.AsString)) then
  begin

  end
  else
  if not DM.ADOQuery1.IsEmpty then
  begin
    ShowMessage('产品类别代码已经存在');
    Exit;
  end;

  DM.ADO08.Edit;
  if DM.ADO08.FieldValues['REVIEW_DAYS']=null then
  begin
    DM.ADO08.FieldValues['REVIEW_DAYS']:=FReviewDays;
  end;
  
  DM.ADO08.FieldByName('difficulty_grade_value').Value := ComboBox1.ItemIndex;
  DM.ADO08.Post;
  DM.ADO08.UpdateBatch();
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Text := 'delete data0620 where PROD_CODE=' + QuotedStr(DBEdit12.Text);
    ExecSQL;


    DM.ADS620.First;
    while not DM.ADS620.Eof do
    begin
      DM.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text := 'insert into data0620(warehouse_ptr,PROD_CODE,EST_SCRAP,est_scrap_ltm) values('+
                  DM.ADS620warehouse_ptr.AsString+','+ QuotedStr(DBEdit12.Text)+','+
                  DM.ADS620EST_SCRAP.AsString + ','+dm.ADS620est_scrap_ltm.AsString+')' ;
//      ShowMessage(DM.ADOQuery1.SQL.Text);
      DM.ADOQuery1.ExecSQL;
      DM.ADS620.Next;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TFrm_ProdCode.DBEdit7Exit(Sender: TObject);
begin
  if (sender as Tdbedit).Text='' then (sender as Tdbedit).Field.Value:=0;
end;

procedure TFrm_ProdCode.FormActivate(Sender: TObject);
begin
  if  DM.ADO08.FieldByName('G_L_POINTER').Value>0 then
  begin
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text :='select gl_acc_number,gl_description from data0103 where rkey = '+ DM.ADO08G_L_POINTER.AsString;
    DM.ADOQuery1.Open;
    if  not DM.ADOQuery1.IsEmpty  then
    begin
     edit1.Text:=DM.ADOQuery1.FieldByName('gl_acc_number').asstring;
     edit1.Font.Color:=clwindowtext;
     label17.Caption:=DM.ADOQuery1.FieldByName('gl_description').asstring;
    end;
  end;

  if  DM.ADO08.FieldByName('PR_GRP_POINTER').Value>0 then
  begin
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text :='select rkey,pr_grp_code,product_group_name from data0007 where rkey ='+ DM.ADO08PR_GRP_POINTER.AsString;
    DM.ADOQuery1.Open;
    if  not DM.ADOQuery1.IsEmpty  then
    begin
     edit4.Text:=DM.ADOQuery1.FieldByName('pr_grp_code').asstring;
     edit4.Font.Color:=clwindowtext;
     label25.Caption:=DM.ADOQuery1.FieldByName('product_group_name').asstring;
    end;
  end;

  DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text :='select category,category_name from data0619 where category= '+ QuotedStr(DM.ADO08category.AsString);
  DM.ADOQuery1.Open;
  if  not DM.ADOQuery1.IsEmpty  then
  begin
   edit5.Text:=DM.ADOQuery1.FieldByName('category').asstring;
   edit5.Font.Color:=clwindowtext;
   label26.Caption:=DM.ADOQuery1.FieldByName('category_name').asstring;
  end;

  if  DM.ADO08.FieldByName('IESMODEL_PTR').Value>0 then
  with DM.ADOQuery1 do
  begin
    close;
    sql.Text:='select ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
              'where rkey='+DM.ADO08.FieldByName('IESMODEL_PTR').AsString;
    open;
    edit2.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
    label30.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
  end;

  if  DM.ADO08.FieldByName('layer_pre').Value>0 then
  with DM.ADOQuery1 do
  begin
   close;
   sql.Text:='select rkey,layers,PRECHAR1,PRECHAR2,sufchar from data0081'+#13+
              'where rkey='+DM.ADO08.FieldByName('layer_pre').AsString;
   open;
   edit3.Text := fieldbyname('layers').AsString;
   label32.Caption := fieldbyname('sufchar').AsString;
  end;

  DM.ADS620.Close;
  if Frm_ProdCode.F_Status = 0 then
  begin
    DM.ADS620.Parameters[0].Value := 0;
  end
  else
  begin
    DM.ADS620.Parameters[0].Value := DM.ADS08PROD_CODE.Value;
  end;
  DM.ADS620.Open;

end;

procedure TFrm_ProdCode.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'gl_acc_number/总帐帐目号码/150,gl_description/总帐帐目名称/200,type/类型/100';
    InputVar.Sqlstr := 'select rkey,gl_acc_number,gl_description ,active_flag,'+
                       'case db_cr when ''D'' then ''借项'' when ''C'' then ''贷项'' end as type '+
                       'from data0103 where active_flag=''Y'' and has_child=0 order by gl_acc_number';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.adsPick.IsEmpty then
      messagedlg('请先建立总账项目!',mtinformation,[mbok],0)
    else
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO08.Edit;
      DM.ADO08.FieldByName('G_L_POINTER').Value := frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      DM.ADO08.Post;
      Edit1.Text := frmPick_Item_Single.adsPick.fieldbyname('gl_acc_number').AsString;
      Label17.Caption := frmPick_Item_Single.adsPick.fieldbyname('gl_description').AsString;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrm_ProdCode.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color:=clblue;
   edit1.SelectAll;
  end;
end;

procedure TFrm_ProdCode.Edit1Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn4')
    and (trim(edit1.Text)<>'') then
  begin
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text := 'select * from data0103 where gl_acc_number ='+ QuotedStr(Trim(Edit1.Text));
    DM.ADOQuery1.Open;
    if DM.ADOQuery1.IsEmpty then
    begin
     messagedlg('帐目编号不正确,请重新输入或选择',mtinformation,[mbok],0);
     label17.Caption:='';
     edit1.SetFocus;
    end
    else
    begin
      edit1.Font.Color := clwindowtext;
      label17.Caption := DM.ADOQuery1.FieldValues['gl_description'];
      DM.ADO08.Edit;
      DM.ADO08.fieldbyname('G_L_POINTER').Value := DM.ADOQuery1.fieldbyname('rkey').Value;
      dm.ADO08.Post;
    end;
  end
  else
  if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn4')
    and (trim(edit1.Text)='') then
  begin
    DM.ADO08.Edit;
    DM.ADO08.fieldbyname('G_L_POINTER').AsVariant :=null;
    dm.ADO08.Post;
    label17.Caption:='';
  end;
end;

procedure TFrm_ProdCode.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'ENG_FLOW_NAME/模型代码/150,ENG_FLOW_DESC/模型名称/200';
    InputVar.Sqlstr := 'select RKEY, ENG_FLOW_NAME, ENG_FLOW_DESC from data0504';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.adsPick.IsEmpty then
      messagedlg('请先建立智能流程模型!',mtinformation,[mbok],0)
    else
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO08.Edit;
      DM.ADO08.FieldByName('IESMODEL_PTR').Value := frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      DM.ADO08.Post;
      edit2.Text := frmPick_Item_Single.adsPick.fieldbyname('ENG_FLOW_NAME').Value;
      label30.Caption := frmPick_Item_Single.adsPick.fieldbyname('ENG_FLOW_DESC').Value;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrm_ProdCode.Edit2Exit(Sender: TObject);
begin
  if trim(edit2.Text)='' then
  begin
    label30.Caption:='';
    DM.ADO08.Edit;
    DM.ADO08.FieldByName('IESMODEL_PTR').AsVariant:=null;
    DM.ADO08.Post;
  end
  else
  if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn5') then
  begin
    with DM.ADOQuery1 do
    begin
      close;
      sql.Text:='select rkey,ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
                'where ENG_FLOW_NAME='''+trim(edit2.Text)+'''';
      open;
      if isempty then
      begin
        messagedlg('智能模型代码输入错误!',mterror,[mbcancel],0);
        edit2.SetFocus;
      end
      else
      begin
        DM.ADO08.Edit;
        DM.ADO08.FieldByName('IESMODEL_PTR').Value := fieldvalues['RKEY'];
        DM.ADO08.Post;
        label30.Caption := fieldbyname('ENG_FLOW_DESC').AsString;
      end;
    end;

  end;
end;

procedure TFrm_ProdCode.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'layers/层数/150,sufchar/产品流水号/200';
    InputVar.Sqlstr := 'select rkey, layers, PRECHAR1, PRECHAR2,sufchar from data0081 order by layers';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.adsPick.IsEmpty then
      messagedlg('请先建立层数编号流水值!',mtinformation,[mbok],0)
    else
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO08.Edit;
      DM.ADO08.FieldByName('layer_pre').Value := frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      DM.ADO08.Post;
      edit3.Text := frmPick_Item_Single.adsPick.fieldbyname('layers').Value;
      label32.Caption := frmPick_Item_Single.adsPick.fieldbyname('sufchar').Value;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrm_ProdCode.FormShow(Sender: TObject);
begin
  ComboBox1.Items.AddObject('零阶',Pointer(0));
  ComboBox1.Items.AddObject('一阶',Pointer(1));
  ComboBox1.Items.AddObject('二阶',Pointer(2));
  ComboBox1.Items.AddObject('三阶',Pointer(3));
  ComboBox1.Items.AddObject('四阶',Pointer(4));
  ComboBox1.Items.AddObject('五阶',Pointer(5));
  ComboBox1.Items.AddObject('六阶',Pointer(6));
  ComboBox1.ItemIndex := 0;
  if DM.ADO08.FieldByName('difficulty_grade_value').AsFloat > 0 then
  begin
    ComboBox1.ItemIndex := DM.ADO08.FieldByName('difficulty_grade_value').AsInteger;
  end;
  if strtoint(vprev) <> 4 then
  begin
    DBEdit10.ReadOnly := True;
    DBEdit12.ReadOnly := True;
    DBEdit13.ReadOnly := True;
  end
  else
  begin
    DBEdit10.ReadOnly := False;
    DBEdit12.ReadOnly := False;
    DBEdit13.ReadOnly := False;
  end;
end;

procedure TFrm_ProdCode.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'category/产品类别代码/150,category_name/产品类别名称/200';
    InputVar.Sqlstr := 'select category,category_name from data0619  order by category ';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.adsPick.IsEmpty then
      messagedlg('请先建立产品类别资料库!',mtinformation,[mbok],0)
    else
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO08.Edit;
      DM.ADO08.FieldByName('category').Value := frmPick_Item_Single.adsPick.fieldbyname('category').AsString;
      DM.ADO08.Post;
      Edit5.Text := frmPick_Item_Single.adsPick.fieldbyname('category').AsString;
      Label26.Caption := frmPick_Item_Single.adsPick.fieldbyname('category_name').AsString;
    end;
    VAutomaticRecode;
  finally
    frmPick_Item_Single.Free;
  end;

end;

procedure TFrm_ProdCode.VAutomaticRecode;
begin
  DM.ADO08.Edit;
  if (F_Status=0) or (F_Status=2) then
  begin
//    DM.ADO08.FieldByName('PROD_CODE').Value := Trim(Edit5.Text) + IntToStr(ComboBox1.ItemIndex) + Trim(Edit4.Text) + Trim(DBEdit21.Text);
    if Length(DBEdit21.Text)=1 then
      DM.ADO08.FieldByName('PROD_CODE').Value := Trim(Edit5.Text) + IntToStr(ComboBox1.ItemIndex) + Trim(Edit4.Text) +'0'+ Trim(DBEdit21.Text)
    else
      DM.ADO08.FieldByName('PROD_CODE').Value := Trim(Edit5.Text) + IntToStr(ComboBox1.ItemIndex) + Trim(Edit4.Text) + Trim(DBEdit21.Text);
    if ComboBox1.ItemIndex=0 then
      DM.ADO08.FieldByName('PRODUCT_NAME').Value := Trim(Label26.Caption)  + Trim(Label25.Caption) + Trim(DBEdit21.Text) + '层'
    else
      DM.ADO08.FieldByName('PRODUCT_NAME').Value := Trim(Label26.Caption) + Trim(ComboBox1.Text) + Trim(Label25.Caption) + Trim(DBEdit21.Text) + '层';
//    ShowMessage(Trim(Label26.Caption));
//    ShowMessage(Trim(Label25.Caption));
  end;
  if Length(DBEdit21.Text)=1 then
    DM.ADO08.FieldByName('PRECHAR1').Value := Trim(Edit5.Text) + IntToStr(ComboBox1.ItemIndex) + Trim(Edit4.Text) +'0'+ Trim(DBEdit21.Text)
  else
    DM.ADO08.FieldByName('PRECHAR1').Value := Trim(Edit5.Text) + IntToStr(ComboBox1.ItemIndex) + Trim(Edit4.Text) + Trim(DBEdit21.Text);
  DM.ADO08.Post;
end;

procedure TFrm_ProdCode.DBEdit21KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort//判断是否输入数字
end;

procedure TFrm_ProdCode.DBEdit21Exit(Sender: TObject);
begin
  DBEdit21.MaxLength := 2;
//  if Length(DBEdit21.Text)=1 then
//    DBEdit21.Text :='0' + DBEdit21.Text;
  VAutomaticRecode;
end;

procedure TFrm_ProdCode.ComboBox1Exit(Sender: TObject);
begin
  VAutomaticRecode;
end;

procedure TFrm_ProdCode.dbgrdh1Columns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  InputVar: PDlgInput ;
  rkey15list: string;
begin
  try
    DM.ADOQuery1.Clone(DM.ADS620);
    dm.ADOQuery1.First;
    while not DM.ADOQuery1.Eof do
    begin
      if DM.ADOQuery1.RecordCount = dm.ADOQuery1.RecNo then
      begin
        rkey15list := rkey15list + DM.ADOQuery1.FieldByName('warehouse_ptr').AsString ;
      end
      else
      begin
        rkey15list := rkey15list + DM.ADOQuery1.FieldByName('warehouse_ptr').AsString + ',';
      end;
      DM.ADOQuery1.Next;
    end;
    
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/250,ABBR_NAME/工厂简称/150';
    if rkey15list <> '' then
    begin
      InputVar.Sqlstr := 'SELECT WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME,RKEY FROM  dbo.Data0015 '+
                        ' where  active_flag=''Y'' and RKEY not in('+rkey15list+') order by WAREHOUSE_CODE';
    end
    else
    begin
      InputVar.Sqlstr := 'SELECT WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME,RKEY FROM  dbo.Data0015 '+
                        ' where  active_flag=''Y''  order by WAREHOUSE_CODE';
    end;
    
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADS620.Edit;
      DM.ADS620warehouse_ptr.Value := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      DM.ADS620WAREHOUSE_CODE.Value := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
      DM.ADS620ABBR_NAME.Value := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      DM.ADS620.Post;

    end;
  finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_ProdCode.dbgrdh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if strtoint(vprev)=4 then
//  begin
//    if (key=46) and (ssCtrl in shift) then
//    begin
//      with dm.ADOQuery1 do
//      begin
//        close;
//        sql.Text:='delete data0620 where category='
//                          +quotedstr(ADO619category.Value);
//        ExecSQL;
//        ADO619.Close;
//        ADO619.Open;
//      end;
//    end;
//    if (key=46) and (ssCtrl in shift) then Abort;
//  end;
end;

end.
