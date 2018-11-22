unit DetailFrm_Mod63;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, uCommFunc,
  Vcl.ComCtrls, RzEdit, RzBtnEdt, uRKeyBtnEdit, uBaseSinglePickListFrm, System.Math,
  Vcl.Menus, IdZLib;

type
  TAfterUpdate_Mod63 = procedure (ACds:TClientDataSet) of object;    //保存后刷新
  TLog = record
   TRANS_TYPE: integer;
   TRANS_DESCRIPTION: string;
   FROM_STRING: string;
   TO_STRING: string;
  end;
  TFrmDetail_Mod63 = class(TfrmBaseEdit)
    ds23: TDataSource;
    ds24: TDataSource;
    cds23: TClientDataSet;
    cds24: TClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    cds04: TClientDataSet;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    Label12: TLabel;
    RKeyRzBtnEdit2: TRKeyRzBtnEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label28: TLabel;
    DBEdit13: TDBEdit;
    Label27: TLabel;
    Label77: TLabel;
    DBEdit52: TDBEdit;
    Label24: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    Label21: TLabel;
    DBEdit17: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit18: TDBEdit;
    Label80: TLabel;
    DBEdit54: TDBEdit;
    Label81: TLabel;
    Label25: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBComboBox1: TDBComboBox;
    RKeyRzBtnEdit3: TRKeyRzBtnEdit;
    Bevel6: TBevel;
    Label46: TLabel;
    DBEdit36: TDBEdit;
    DBEdit34: TDBEdit;
    Label38: TLabel;
    Label42: TLabel;
    DBEdit35: TDBEdit;
    Bevel5: TBevel;
    Label45: TLabel;
    DBEdit33: TDBEdit;
    DBEdit31: TDBEdit;
    Label37: TLabel;
    Label41: TLabel;
    DBEdit32: TDBEdit;
    Bevel4: TBevel;
    Label44: TLabel;
    DBEdit30: TDBEdit;
    Label36: TLabel;
    DBEdit28: TDBEdit;
    Label40: TLabel;
    DBEdit29: TDBEdit;
    Bevel3: TBevel;
    DBEdit27: TDBEdit;
    Label43: TLabel;
    Label35: TLabel;
    DBEdit25: TDBEdit;
    Label39: TLabel;
    DBEdit26: TDBEdit;
    Bevel2: TBevel;
    DBEdit24: TDBEdit;
    Label34: TLabel;
    Label32: TLabel;
    DBEdit22: TDBEdit;
    Label33: TLabel;
    DBEdit23: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit20: TDBEdit;
    Label30: TLabel;
    DBEdit19: TDBEdit;
    Label29: TLabel;
    Bevel1: TBevel;
    Label31: TLabel;
    Label47: TLabel;
    DBEdit37: TDBEdit;
    Label78: TLabel;
    DBComboBox2: TDBComboBox;
    Label79: TLabel;
    GroupBox1: TGroupBox;
    Label51: TLabel;
    Memo1: TMemo;
    Label48: TLabel;
    DBEdit38: TDBEdit;
    Label76: TLabel;
    DBEdit49: TDBEdit;
    Label49: TLabel;
    Edit8: TEdit;
    Label50: TLabel;
    DBEdit39: TDBEdit;
    RKeyRzBtnEdit4: TRKeyRzBtnEdit;
    DBCheckBox3: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    Label16: TLabel;
    Memo4: TMemo;
    Bevel8: TBevel;
    Label54: TLabel;
    DBEdit41: TDBEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Label55: TLabel;
    DBMemo2: TDBMemo;
    Label56: TLabel;
    DBEdit42: TDBEdit;
    Label57: TLabel;
    DBEdit43: TDBEdit;
    Label60: TLabel;
    Label61: TLabel;
    DBEdit44: TDBEdit;
    Label58: TLabel;
    DBEdit45: TDBEdit;
    Label59: TLabel;
    DBEdit46: TDBEdit;
    Label62: TLabel;
    DBEdit47: TDBEdit;
    Label63: TLabel;
    DBEdit48: TDBEdit;
    Label66: TLabel;
    DBEdit51: TDBEdit;
    Label65: TLabel;
    GroupBox2: TGroupBox;
    Label67: TLabel;
    Label75: TLabel;
    Bevel7: TBevel;
    Label70: TLabel;
    Label69: TLabel;
    Label68: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    RKeyRzBtnEdit6: TRKeyRzBtnEdit;
    RKeyRzBtnEdit7: TRKeyRzBtnEdit;
    RKeyRzBtnEdit8: TRKeyRzBtnEdit;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label26: TLabel;
    DBEdit40: TDBEdit;
    Label64: TLabel;
    DBEdit50: TDBEdit;
    Label74: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    DBEdit53: TDBEdit;
    PM2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure DBCheckBox3Click(Sender: TObject);
    procedure RKeyRzBtnEdit4ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit7ButtonClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure RKeyRzBtnEdit6ButtonClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Label82Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PM2Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure DBEdit50KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit50Exit(Sender: TObject);
  private
    Fs:TFileStream;
    Fnote_index : Integer;  //记录最大节点
    Fship_new : Boolean;
    FLog :array[0..5] of TLog;
    procedure bt_status; //装运信息操作模式，更改按钮状态
    procedure UnPackStream(var CompressedStream: TMemoryStream);
    procedure Check_Before_Save; //保存前检查
    { Private declarations }
  public
    F_status : Integer;
//    F_seed : string;
    FAfterUpdate : TAfterUpdate_Mod63;    //保存后刷新
    procedure StateReadOnly();
    procedure GetData(ARkey : string);
    procedure GetNew();
    procedure GetShow();
    procedure Getshipdata();
    function code_error(ACode: string): boolean;
    procedure Update_Seed(ATable : string); //更新
    { Public declarations }
  end;

var
  FrmDetail_Mod63: TFrmDetail_Mod63;
  note_var:tstringlist; //记事本变量

implementation

{$R *.dfm}

uses SelectedFrm_Mod63 , Winapi.ShellAPI ;

{ TFrmDetail_ }

procedure TFrmDetail_Mod63.BitBtn10Click(Sender: TObject);
var
  node:Ttreenode;
begin
  inherited;
  if trim(dbedit41.Text)='' then
  begin
    messagedlg('装运地点不能为空！',mtconfirmation,[mbok],0);
    dbedit41.SetFocus;
    exit;
  end;
  if trim(RKeyRzBtnEdit7.Text)='' then
  begin
    messagedlg('对应的增值税不允许为空！',mtconfirmation,[mbok],0);
    RKeyRzBtnEdit7.SetFocus;
    exit;
  end;
  if trim(dbedit48.Text)='' then
  begin
    messagedlg('装运提前天数不允许为空！',mtconfirmation,[mbok],0);
    dbedit48.SetFocus;
    exit;
  end;

  cds24.Post;
  bt_status;
  if Fship_new then
  begin
    node:=treeview1.Items.AddChild(treeview1.Selected,cds24.FieldByName('FACTORY_LOCATION').Value);
    node.SelectedIndex:=Fnote_index;
    Fnote_index:=Fnote_index+1;
    treeview1.Selected:=node;
  end
  else
    treeview1.Selected.Text:=dbedit41.Text;

end;

procedure TFrmDetail_Mod63.BitBtn11Click(Sender: TObject);
begin
  inherited;
  cds24.Cancel;
  bt_status;
end;

procedure TFrmDetail_Mod63.btnCloseClick(Sender: TObject);
begin
  inherited;
//  if dm.aq23.State=dsinsert then begin dm.aq23.Cancel;v_close:=1; end
//  else if (bitbtn1.Enabled=true) and ((dm.aq23.Modified) or (dm.aq24.Modified) or (v_edit)) then
//    if messagedlg('数据已修改，是否保存？',mtconfirmation,[mbyes,mbno],0)=mryes then
//      begin bitbtn1click(sender);exit; end
//    else begin dm.aq23.Cancel; dm.aq24.Cancel; v_close:=1; end;
  if cds23.State = dsInsert then
  begin
    cds23.Cancel;
  end
  else if (btnSave.Enabled=true) and ((cds23.Modified) or (cds24.Modified)) then
  begin
    if messagedlg('数据已修改，是否保存？',mtconfirmation,[mbyes,mbno],0) = mryes then
    begin
      btnSaveClick(Sender);
      Exit;
    end;
//    else
//    begin
//      cds23.Cancel;
//      cds24.Cancel;
//    end;
  end;
//  self.ModalResult:=mrcancel;
  Close;
end;



procedure TFrmDetail_Mod63.Update_Seed(ATable : string);
var
  i, L_length: integer;
  L_Seed: string;
  L_last, Lnew_seed, LSql04: string;
begin
  LSql04 := 'select Seed_Value from data0004 where  table_name = ' + QuotedStr(ATable);
  gSvrIntf.IntfGetDataBySql(LSql04,cds04);
  L_Seed := cds04.FieldByName('Seed_Value').AsString;

  L_length := length(L_seed);
  for i := L_length downto 1 do
  if not (CharInSet(L_seed[i] , ['0'..'9'])) then //如果不是数字
  begin
    L_last := floattostr(power(10, L_length - 1) + strtofloat(copy(L_seed, i + 1, L_length - i)) + 1); //后缀加1
    Lnew_seed := copy(L_seed, 1, i) + copy(L_last, i + 1, L_length - i);
    break;
  end
  else
  if i = 1 then //如果第一位仍然是数字
  begin
    L_last := floattostr(power(10, L_length) + strtofloat(L_seed) + 1);
    Lnew_seed := copy(L_last, 2, L_length);
  end;
//  sqlstr := ' update data0004 set Seed_Value= ' + QuotedStr(Lnew_Seed) + ' where rkey= ' + IntToStr(ArKey);
//  result := MyDataClass.ExecSql(sqlstr);
  cds04.Edit;
  cds04.FieldByName('Seed_Value').Value := Lnew_seed;
  cds04.Post;
end;

procedure TFrmDetail_Mod63.Check_Before_Save;
var
  LSql23,LSql023,LSql0023 : string;
  LCds23,LCds023,LCds0023 : TClientDataSet;
begin

  if (trim(maskedit1.Text)='') then
  begin
    messagedlg('供应商代码不能为空！',mtconfirmation,[mbok],0);
    notebook1.PageIndex:=1;
    maskedit1.SetFocus;
    Abort;
  end; //-------------

  if not (CharInSet(maskedit1.Text[length(maskedit1.Text)] , ['0'..'9'])) then
  begin
    messagedlg('供应商代码最后一位必须为数字！',mtconfirmation,[mbok],0);
    notebook1.PageIndex:=1;
    maskedit1.SetFocus;
    Abort;
  end; //-------------

  if (trim(dbedit3.Text)='') then
  begin
    messagedlg('供应商名称不能为空！',mtconfirmation,[mbok],0);
    notebook1.PageIndex:=1;
    dbedit3.SetFocus;
    Abort;
  end; //-------------

  if (trim(dbedit4.Text)='') then
  begin
    messagedlg('名称缩写不能为空！',mtconfirmation,[mbok],0);
    notebook1.PageIndex:=1;
    dbedit4.SetFocus;
    Abort;
  end; //-------------

  if trim(rkeyrzbtnedit2.Text)='' then
  begin
    messagedlg('货币不能为空！',mtconfirmation,[mbok],0);
    notebook1.PageIndex:=1;
    rkeyrzbtnedit2.SetFocus;
    Abort;
  end; //-------------

  if cds24.IsEmpty then
  begin
    messagedlg('至少需要一个装运地址！',mtconfirmation,[mbok],0);
    notebook1.PageIndex:=5;
    treeview1.Items[5].Selected:=true;
    Abort;
  end; //-------------

  if DBRadioGroup1.Value='1' then
  begin
    if Trim(DBEdit11.Text)='' then
    begin
      messagedlg('供应商无效说明不能为空！',mtconfirmation,[mbok],0);
      notebook1.PageIndex:=1;
      DBEdit11.SetFocus;
      Abort;
    end;
  end;

//20150709检查是否重名----------
//  if (F_status=0) or (F_status=2) then
//  begin
    LSql23 := 'select top 1  SUPPLIER_NAME,rkey from data0023 where SUPPLIER_NAME='''+
              Trim(DBEdit3.Text)+'''';
    LSql023 := 'select top 1  ABBR_NAME,rkey from data0023 where ABBR_NAME='''+
              Trim(DBEdit4.Text)+'''';
    LSql0023 := 'select top 1  code,rkey from data0023 where code='''+
              Trim(MaskEdit1.Text)+'''';
    LCds23 := TClientDataSet.Create(Self);
    LCds023 := TClientDataSet.Create(Self);
    LCds0023 := TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql23,LSql023,LSql0023]),
    [LCds23,LCds023,LCds0023]) then Exit;
    if (UpperCase(Trim(MaskEdit1.Text)) = UpperCase(LCds0023.FieldByName('code').AsString)) and
       (cds23.FieldByName('rkey').AsString <> LCds0023.FieldByName('rkey').AsString) then
      if not LCds0023.IsEmpty then
      begin
        ShowMessage('供应商代码重复，请修改！');
        Abort;
      end;
    if (UpperCase(cds23.FieldByName('SUPPLIER_NAME').AsString) = UpperCase(LCds23.FieldByName('SUPPLIER_NAME').AsString)) and
       (cds23.FieldByName('rkey').AsString <> LCds23.FieldByName('rkey').AsString) then
      if not LCds23.IsEmpty then
      begin
        ShowMessage('供应商名称重复，请修改！');
        Abort;
      end;
    if (UpperCase(cds23.FieldByName('ABBR_NAME').AsString) = UpperCase(LCds023.FieldByName('ABBR_NAME').AsString)) and
       (cds23.FieldByName('rkey').AsString <> LCds023.FieldByName('rkey').AsString) then
      if not LCds023.IsEmpty then
      begin
        ShowMessage('供应商简称重复，请修改！');
        Abort;
      end;
  finally
    Lcds23.Free;
    LCds023.Free;
    LCds0023.Free;
  end;
//  end;
end;

procedure TFrmDetail_Mod63.btnSaveClick(Sender: TObject);
var
  LCds04 , Lcds318 : TClientDataSet;
  LSEED_FLAG , j : Integer;
  LPostData : OleVariant;
begin
  inherited;
  Check_Before_Save;
  if (F_status = 0) or (F_status = 2) then
  begin
    LCds04 := TClientDataSet.Create(nil);
    try
      gSvrIntf.IntfGetDataBySql('select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG from Data0004 where table_name = ' + QuotedStr('Data0023'),LCds04);
      LSEED_FLAG:= LCds04.FieldByName('SEED_FLAG').AsInteger;
      if Self.code_error(Trim(MaskEdit1.Text)) then
      begin
        if LSEED_FLAG <> 1 then
        begin
          MaskEdit1.Text := LCds04.FieldByName('seed_value').AsString;
          messagedlg('供应商代码重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
        end
        else
        begin
          messagedlg('供应商代码重复!请手工重新输入',mterror,[mbok],0);
          MaskEdit1.SetFocus;
          exit;
        end;
      end;
    finally
      LCds04.Free;
    end;
    if (LSEED_FLAG <>1) then
      Update_Seed('Data0023') ;
  end;
//  LCds23 := TClientDataSet.Create(Self);
//  Lcds24 := TClientDataSet.Create(Self);
  Lcds318 := TClientDataSet.Create(Self);
  try
    if (F_status = 0) or (F_status = 2) then
    begin
      cds23.Edit;
      cds23.FieldByName('IDKEy').Value :=gFunc.CreateIDKey;
      cds23.Post;

      cds24.First;
      while not cds24.Eof do
      begin
        cds24.Edit;
        cds24.FieldByName('D23_IDKey').Value := cds23.FieldByName('IDKEy').Value;
        cds24.Post;
        cds24.Next;
      end;
    end
    else
    begin
      cds24.First;
      while not cds24.Eof do
      begin
        cds24.Edit;
        cds24.FieldByName('supplier_ptr').Value := cds23.FieldByName('rkey').Value;
        cds24.Post;
        cds24.Next;
      end;
      gSvrIntf.IntfGetDataBySql('select supplier_ptr,TRANS_TYPE,TRANS_DESCRIPTION,FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE from Data0318 where 1=2',LCds318);
      FLog[0].TO_STRING:= cds23.FieldByName('CODE').AsString;
      FLog[1].TO_STRING:= cds23.FieldByName('SUPPLIER_NAME').AsString;
      FLog[2].TO_STRING:= cds23.FieldByName('ABBR_NAME').AsString;
      FLog[3].TO_STRING:= cds23.FieldByName('status').AsString;
      FLog[4].TO_STRING:= cds23.FieldByName('PUT_ALL_INV_HOLD').AsString;
      FLog[5].TO_STRING:= cds23.FieldByName('EDI_OUT_NEW_PO').AsString;

      for j:= 0 to 5 do
      begin
        if FLog[j].FROM_STRING <> FLog[j].TO_STRING then
        begin
          Lcds318.Append;
          Lcds318.FieldByName('supplier_ptr').Value := cds23.FieldByName('rkey').AsString;
          Lcds318.FieldByName('TRANS_TYPE').Value := FLog[j].TRANS_TYPE;
          Lcds318.FieldByName('TRANS_DESCRIPTION').Value := FLog[j].TRANS_DESCRIPTION;
          Lcds318.FieldByName('FROM_STRING').Value := FLog[j].FROM_STRING;
          Lcds318.FieldByName('TO_STRING').Value := FLog[j].TO_STRING;
          Lcds318.FieldByName('USER_PTR').Value := gVar.rkey73;
          Lcds318.FieldByName('TRANS_DATE').Value := gFunc.GetSvrDateTime();
          Lcds318.FieldByName('PROGRAM_SOURCE').Value := 23;
          Lcds318.Post;

        end;
      end;
    end;
 
    cds23.Edit;
    cds23.FieldByName('code').Value := Trim(MaskEdit1.Text);
    cds23.FieldByName('update_date').Value := gFunc.GetSvrDateTime();
    cds23.FieldByName('user_ptr').Value := gVar.rkey05;
    cds23.FieldByName('Remark').Value := Memo1.Text;
    cds23.FieldByName('RemarkSpec').Value := Memo4.Text;
    cds23.Post;

    if cds23.State in [dsEdit,dsInsert] then cds23.Post;
    if cds24.State in [dsEdit,dsInsert] then cds24.Post;
    if cds04.State in [dsEdit,dsInsert] then cds04.Post;
    if Lcds318.State in [dsEdit,dsInsert] then cds04.Post;
    LPostData := VarArrayCreate([0,4],varVariant);
    if cds23.ChangeCount > 0 then
      LPostData[1] := cds23.Delta;
    if cds24.ChangeCount > 0 then
      LPostData[2] := cds24.Delta;
    if cds04.ChangeCount > 0 then
      LPostData[0] := cds04.Delta;
    if Lcds318.ChangeCount > 0 then
      LPostData[3] := Lcds318.Delta;
    if gSvrIntf.IntfPostModData('公共基础', 63, LPostData,1) then
    begin
      if cds23.ChangeCount > 0 then
        cds23.MergeChangeLog;
      if cds24.ChangeCount > 0 then
        cds24.MergeChangeLog;
      if cds04.ChangeCount > 0 then
        cds04.MergeChangeLog;
      if Lcds318.ChangeCount > 0 then
         Lcds318.MergeChangeLog;
      showmessage('保存成功');
      Self.ModalResult := mrOk;
      if Assigned(FAfterUpdate) then
      FAfterUpdate(nil);
      Close;
    end;

  finally
    Lcds318.Free;

  end;

end;

procedure TFrmDetail_Mod63.bt_status;
begin
  treeview1.Enabled := not treeview1.Enabled;
  btnSave.Enabled := not btnSave.Enabled;
  btnClose.Enabled := not btnClose.Enabled;
  dbedit41.Enabled := not dbedit41.Enabled;
  dbedit42.Enabled := not dbedit42.Enabled;
  dbedit43.Enabled := not dbedit43.Enabled;
  dbedit44.Enabled := not dbedit44.Enabled;
  dbedit45.Enabled := not dbedit45.Enabled;
  dbedit46.Enabled := not dbedit46.Enabled;
  dbedit47.Enabled := not dbedit47.Enabled;
  dbedit48.Enabled := not dbedit48.Enabled;
  RKeyRzBtnEdit6.Enabled := not RKeyRzBtnEdit6.Enabled;
  dbedit51.Enabled := not dbedit51.Enabled;
  dbmemo2.Enabled := not dbmemo2.Enabled;
  RKeyRzBtnEdit8.Enabled := not RKeyRzBtnEdit8.Enabled;
  RKeyRzBtnEdit7.Enabled := not RKeyRzBtnEdit7.Enabled;
  dbcheckbox6.Enabled :=not dbcheckbox6.Enabled;
  dbcheckbox4.Enabled :=not dbcheckbox4.Enabled;
  dbcheckbox5.Enabled :=not dbcheckbox5.Enabled;
  bitbtn10.Enabled := not bitbtn10.Enabled;
  bitbtn11.Enabled := not bitbtn11.Enabled;
end;

function TFrmDetail_Mod63.code_error(ACode: string): boolean;
var
  LSql23 : string;
  LCds23 : TClientDataSet;
begin
  result:=false;
  LCds23 := TClientDataSet.Create(Self);
  try
    LSql23 := 'select rkey ,code from data0023 where code = ' +QuotedStr(ACode);
    gSvrIntf.IntfGetDataBySql(LSql23,LCds23);
    if not LCds23.IsEmpty then
      Result := True;
  finally
    LCds23.Free;
  end;
end;

procedure TFrmDetail_Mod63.DBCheckBox3Click(Sender: TObject);
begin
  inherited;
  if DBCheckBox3.Checked then
  begin
    DBRadioGroup3.Visible := True;
    DBRadioGroup3.ItemIndex := 0;
  end
  else
  begin
    DBRadioGroup3.Visible := False;
    DBRadioGroup3.ItemIndex := -1;
  end;
end;

procedure TFrmDetail_Mod63.DBEdit50Exit(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit50.Text)='' then DBEdit50.Text:='0';
end;

procedure TFrmDetail_Mod63.DBEdit50KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(key , ['0'..'9','.',#8,#13])) then abort;
  if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',DBEdit50.Text)>0 then abort;
end;

procedure TFrmDetail_Mod63.DBRadioGroup1Change(Sender: TObject);
begin
  inherited;
  if DBRadioGroup1.Value='0' then
  begin
    DBEdit11.Visible:=False;
    Label13.Visible := False;
  end
  else
  begin
    Label13.Visible := true;
    DBEdit11.Visible:=True;
  end;
end;

procedure TFrmDetail_Mod63.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmDetail_Mod63 := nil;
end;

procedure TFrmDetail_Mod63.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(fs) then fs.Free;
end;

procedure TFrmDetail_Mod63.FormShow(Sender: TObject);
var
  Lnode : TTreeNode;
  LArr: TArray<Integer>;
  I : Integer;
begin
  inherited;
  Fnote_index:=6; //变量赋初始值
  cds24.First;    //读装运地址
  while not cds24.Eof do
  begin
    Lnode:=treeview1.Items.Addchild(treeview1.Items[5],cds24.FieldByName('factory_location').AsString);
    Lnode.SelectedIndex:=Fnote_index;
    Fnote_index:=Fnote_index+1;
    cds24.Next;
  end;
  TreeView1.SetFocus;
  TreeView1.Items[1].Selected := True;
  TreeView1.FullExpand;
  Notebook1.PageIndex := 1;
  TreeView1.ReadOnly := True;
  LArr := gFunc.GetUserModAuthIDArr(StrToInt(gvar.rkey73),63);
  for I := 0 to Length(LArr) - 1 do        //right如果财务权限，不允许查看财务信息
  begin
    if  LArr[I]<>7 then
    begin
      treeview1.Items[2].SelectedIndex:=0;
    end
    else
    begin
      treeview1.Items[2].SelectedIndex:=2;
      Break;
    end;
  end;

end;

procedure TFrmDetail_Mod63.GetData(ARkey : string);
var
  Lsql23,Lsql24,Lsql04 : string;
begin
  Lsql23 := ' select * from data0023 where rkey = ' + ARkey;
  Lsql24 := ' select * from data0024 where supplier_ptr = ' + ARkey;
  Lsql04 := ' select * from data0004 where table_name = ''DATA0023''';

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql23,Lsql24,Lsql04]),[cds23,cds24,cds04]) then Exit;
//  if (not cds23.IsEmpty) and (cds23.FieldByName('IDKey').AsString='') then
//  begin
//    cds23.Edit;
//    cds23.FieldByName('IDKey').Value := gFunc.CreateIDKey;
//    cds23.Post;
//  end;
//  cds24.DisableControls;
//  try
//    if not cds24.IsEmpty then
//    begin
//      cds24.First;
//      while not cds24.Eof do
//      begin
//        if cds24.FieldByName('D23_IDKey').AsString = '' then
//        begin
//          cds24.Edit;
//          cds24.FieldByName('D23_IDKey').Value := cds23.FieldByName('IDKey').Value;
//          cds24.Post;
//        end;
//        cds24.Next;
//      end;
//    end;
//  finally
//    cds24.EnableControls;
//  end;
end;

procedure TFrmDetail_Mod63.GetNew;
begin
  cds23.Edit;
  cds23.FieldByName('status').Value := 0;    //状态为正常
  cds23.FieldByName('put_all_inv_hold').Value := 'N';
  cds23.FieldByName('country_ptr').Value := 3;    //国家为中国
  cds23.FieldByName('currency_ptr').Value := 1;  //货币为人民币
  cds23.FieldByName('suppier_ent_date').Value := gFunc.GetSvrDateTime(dtdate);  //合作日期为当天
  cds23.FieldByName('brother_flag').Value := False;  //关联公司
  cds23.FieldByName('payment_terms').Value := 0;   //净付款天数
  cds23.FieldByName('discount').Value := 0;      //付款折扣1
  cds23.FieldByName('discount_days').Value := 0;    //付款折扣天数1
  cds23.FieldByName('discount2').Value := 0;      //付款折扣2
  cds23.FieldByName('discount2_days').Value := 0;  //付款折扣天数2
  cds23.FieldByName('edi_out_new_po').Value := 0;
  cds23.Post;
  if cds04.FieldByName('SEED_FLAG').AsInteger <>1 then
    MaskEdit1.Text := cds04.FieldByName('SEED_VALUE').AsString;
  if cds04.FieldByName('SEED_FLAG').AsInteger =4 then
    MaskEdit1.ReadOnly := True;
end;

procedure TFrmDetail_Mod63.Getshipdata;
var
  LSql189 : string;
  Lcds189 : TClientDataSet;
begin
  Lcds189 := TClientDataSet.Create(Self);
  try
    LSql189 := ' select state_id,name,state_tax from data0189 where rkey = '+ cds24.FieldByName('CITY_TAX_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(LSql189,Lcds189) ;
    if not Lcds189.IsEmpty then
    begin
      edit6.Text := Lcds189.FieldByName('state_id').Value;
      edit7.Text := Lcds189.FieldByName('state_tax').Value;
    end
    else
    begin
      edit6.Text:='';
      edit7.Text:='';
    end;
  finally
    Lcds189.Free;
  end;

end;

procedure TFrmDetail_Mod63.GetShow;
var
  Lcds05 : TClientDataSet;
  Lsql05 : string;
begin
  Lcds05 := TClientDataSet.Create(nil);

  try
    Lsql05 := 'select * from data0005 where rkey = ' + cds23.FieldByName('user_ptr').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql05,Lcds05);
    Edit8.Text := Lcds05.FieldByName('employee_name').AsString;
  finally
    Lcds05.Free;
  end;

  if DBCheckBox3.Checked then
  begin
    DBRadioGroup3.Visible := True;
//    DBRadioGroup3.ItemIndex := 0;
  end
  else
  begin
    DBRadioGroup3.Visible := False;
//    DBRadioGroup3.ItemIndex := -1;
  end;
  if F_status <> 2 then  //2为复制  即是除了复制
  begin
    if cds04.FieldByName('SEED_FLAG').AsInteger =4 then
      MaskEdit1.ReadOnly := True;
    MaskEdit1.Text := cds23.FieldByName('code').AsString;
    if F_status = 1 then //编辑
    begin
//    RKEY23:= dm.aq23.FieldByName('RKEY').AsInteger;
      FLog[0].TRANS_TYPE := 100;
      FLog[0].TRANS_DESCRIPTION := '更改供应商代码';
      FLog[0].FROM_STRING := cds23.FieldByName('CODE').AsString;
      FLog[1].TRANS_TYPE := 101;
      FLog[1].TRANS_DESCRIPTION := '更改供应商名称';
      FLog[1].FROM_STRING := cds23.FieldByName('SUPPLIER_NAME').AsString;
      FLog[2].TRANS_TYPE := 102;
      FLog[2].TRANS_DESCRIPTION := '更改供应商简称';
      FLog[2].FROM_STRING := cds23.FieldByName('ABBR_NAME').AsString;
      FLog[3].TRANS_TYPE := 103;
      FLog[3].TRANS_DESCRIPTION := '更改状态';
      FLog[3].FROM_STRING := cds23.FieldByName('status').AsString;
      FLog[4].TRANS_TYPE := 104;
      FLog[4].TRANS_DESCRIPTION := '更改暂缓付款';
      FLog[4].FROM_STRING := cds23.FieldByName('PUT_ALL_INV_HOLD').AsString;
      FLog[5].TRANS_TYPE := 105;
      FLog[5].TRANS_DESCRIPTION := '是否VMI采购';
      FLog[5].FROM_STRING := cds23.FieldByName('EDI_OUT_NEW_PO').AsString;
    end;
  end
  else  //复制
  begin
    if cds04.FieldByName('SEED_FLAG').AsInteger <>1 then
      MaskEdit1.Text := cds04.FieldByName('SEED_VALUE').AsString;
    if cds04.FieldByName('SEED_FLAG').AsInteger =4 then
      MaskEdit1.ReadOnly := True;
  end;
  Memo1.Text := cds23.FieldByName('remark').AsString;
  Memo4.Text := cds23.FieldByName('RemarkSpec').AsString;
end;

procedure TFrmDetail_Mod63.Label82Click(Sender: TObject);
begin
  inherited;
  pm2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmDetail_Mod63.N1Click(Sender: TObject);
begin
  inherited;
  if treeview1.Selected.SelectedIndex = 5 then  //如果当前选中节点为装运地点
  begin
    cds24.Append;
    cds24.FieldByName('country_ptr').Value := cds23.FieldByName('country_ptr').Value;
    cds24.FieldByName('state').Value := cds23.FieldByName('state').Value;
    cds24.FieldByName('zip').Value := cds23.FieldByName('zip').Value;
    cds24.FieldByName('phone').Value := cds23.FieldByName('phone').Value;
    cds24.FieldByName('fax').Value := cds23.FieldByName('fax').Value;
    cds24.FieldByName('contact').Value := cds23.FieldByName('contact_name_1').Value;
    cds24.FieldByName('shipping_lead_time').Value := 0;
    cds24.FieldByName('state_ship_tax_flag').Value := 'N';
    cds24.FieldByName('STATE_INVT_TAX_FLAG').Value := 'Y';
    cds24.FieldByName('STATE_MISC_TAX_FLAG').Value := 'N';
//    Getshipdata;


    Notebook1.PageIndex := 5;
    bt_status;
    Edit6.Text := '';
    Edit7.Text := '';
    Fship_new := True;

  end;

end;

procedure TFrmDetail_Mod63.N2Click(Sender: TObject);
begin
  inherited;
  if treeview1.Selected.SelectedIndex > 5 then
  begin
    cds24.Edit;
    bt_status;
    Fship_new := False;
  end;
end;

procedure TFrmDetail_Mod63.N3Click(Sender: TObject);
begin
  inherited;
  if treeview1.Selected.SelectedIndex > 5 then
  begin
    cds24.Delete;
    TreeView1.Selected.Delete;
    Fnote_index:=Fnote_index-1;
  end;
end;

procedure TFrmDetail_Mod63.UnPackStream(var CompressedStream: TMemoryStream);
var
  SourceStream: TDecompressionStream;
  DestStream: TMemoryStream;
  Buffer: PChar;
  Count: integer;
  tmpstr:string;
Begin
  CompressedStream.Position:=0;
  tmpstr:='DDD';
  CompressedStream.ReadBuffer(tmpstr[1], 3);
  if tmpstr<>#6#3#1 then exit; //判断是否压缩的流
  CompressedStream.ReadBuffer(Count, SizeOf(Count));
  GetMem(Buffer, Count);
  DestStream := TMemoryStream.Create;
  SourceStream := TDecompressionStream.Create(CompressedStream);
  Try
    SourceStream.ReadBuffer(Buffer^, Count);
    DestStream.WriteBuffer(Buffer^, Count);
    SourceStream.Free;
    DestStream.Position := 0;//复位流指针
    CompressedStream.LoadFromStream(DestStream);
  finally
    FreeMem(Buffer);
    DestStream.Free;
  end;

end;

procedure TFrmDetail_Mod63.N4Click(Sender: TObject);
var
  Lsql23,LFileName : string;
  LCds23 : TClientDataSet;
  LOpenFile : TOpenDialog;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,63) then      //检查
  begin
    Exit;
  end;
  if F_status = 1 then
  begin
    Lsql23 := 'select case when AttachFile IS NULL THEN 0 ELSE 1 END from data0023 where rkey =' + cds23.FieldByName('Rkey').AsString;
    LCds23 := TClientDataSet.Create(Self);
    try
      if not gSvrIntf.IntfGetDataBySql(Lsql23,LCds23) then Exit;
      if (LCds23.fields[0].Value = 1) and
         (MessageDlg('已经存在附件，是否覆盖？', mtConfirmation, [mbYes,mbNo],0) <> mryes) then
      begin
        Exit;
      end;
    finally
      LCds23.Free;
    end;
  end;
  LOpenFile:=TOpenDialog.Create(Application);
  try
    LOpenFile.Filter:='*.pdf|*.pdf';
    if LOpenFile.Execute then
    begin
      LFileName:=LOpenFile.FileName;

      Fs:= TFileStream.Create(LFileName, fmOpenRead);
      if fs.Size > 1024*1024*10 then
      begin
        ShowMessage('文件大于10M，请处理后重新上传！');
        exit;
      end;
      Label74.Font.Color:= clBlue;
    end;
    LOpenFile.Free;
  except
    on e: exception do
    begin
      LOpenFile.Free;
      ShowMessage('文件正在使用中，请关闭后重新上传');
      Exit;
    end;
  end;
end;



procedure TFrmDetail_Mod63.N5Click(Sender: TObject);
var
  ms : TMemoryStream;
  filePath,fileName,Lsql23 : string;
  Lcds23 : TClientDataSet;
begin
  inherited;
  if (F_status = 0) or (F_status = 5) or (Label74.Caption ='未上传附件') then Exit;
  filePath:='D:\temp\';
  if Assigned(fs) then fs.Free;
  Screen.Cursor:= crHourGlass;
  ms:=TMemoryStream.Create;

  try
    try
      if not DirectoryExists(filePath) then
        if not CreateDir(filePath) then
        begin
          ShowMessage('创建临时文件夹错误：'+ filePath);
          Exit;
        end;

      Lsql23 := 'select AttachFile from data0023  where rkey = ' + cds23.FieldByName('rkey').AsString;

      Lcds23 := TClientDataSet.Create(Self);
      try

        if not gSvrIntf.IntfGetDataBySql(Lsql23,LCds23) then Exit;
        TBlobField(Lcds23.Fields[0]).SaveToStream(ms);
        fileName := cds23.FieldByName('code').AsString + cds23.FieldByName('abbr_name').AsString + '.pdf';

      finally
        Lcds23.Free;
      end;

//      with dm.aqtmp do
//      begin
//        Close;
//        SQL.Text:= 'select AttachFile from data0023  where rkey = '+ dm.aq23rkey.AsString;
//        Open;
//        TBlobfield(dm.aqtmp.Fields[0]).SaveToStream(ms);        //把从数据库里的文件写入文件流
//      end;
//      fileName:= dm.aq23code.AsString + dm.aq23abbr_name.AsString + '.pdf';
      UnPackStream(ms);
      ms.Position:=0;
      ms.SaveToFile(filePath + fileName);
      ShellExecute(0,'open',pchar(filePath + fileName),nil,nil,SW_SHOWNORMAL);
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  finally
    Screen.Cursor:= crDefault;
    ms.Free;
  end;
end;



procedure TFrmDetail_Mod63.PM2Popup(Sender: TObject);
begin
  inherited;
  N5.Enabled := (Trim(Label74.Caption) = '已上传附件') ;
//  ShowMessage(Label74.Caption);
end;

procedure TFrmDetail_Mod63.RKeyRzBtnEdit4ButtonClick(Sender: TObject);
var
  LFrm:TFrmSelected_Mod63;
begin
  inherited;
  LFrm := TFrmSelected_Mod63.Create(Self);
  try
//    LFrm.InitWithPickID(63,4);
//    LFrm.eh1.ReadOnly := False;
//    LFrm.eh1.Columns[0].ReadOnly := False;
    LFrm.GetRkey;
    if LFrm.ShowModal = mrOk then
    begin
      LFrm.cds496.First;
      while not LFrm.cds496.Eof do
      begin
        if LFrm.cds496.FieldByName('checked').AsBoolean then
        begin
          RKeyRzBtnEdit4.Text := RKeyRzBtnEdit4.Text + LFrm.cds496.FieldByName('dept_name').AsString;
        end;
        LFrm.cds496.Next;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmDetail_Mod63.RKeyRzBtnEdit6ButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(63,6);
    if LFrm.ShowModal = mrOk then
    begin
      cds24.Edit;
      cds24.FieldByName('SHIPPING_METHOD').Value := LFrm.cdsPick.FieldByName('description').Value;
//      cds24.Post;

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmDetail_Mod63.RKeyRzBtnEdit7ButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(63,5);
    if LFrm.ShowModal = mrOk then
    begin
      cds24.Edit;
      cds24.FieldByName('CITY_TAX_PTR').Value := LFrm.cdsPick.FieldByName('rkey').Value;
//      cds24.Post;
      edit6.Text := LFrm.cdsPick.FieldByName('state_id').Value;
      edit7.Text := LFrm.cdsPick.FieldByName('state_tax').Value;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmDetail_Mod63.StateReadOnly;
begin
  cds23.ReadOnly := True;
  cds24.ReadOnly := True;
  MaskEdit1.enabled:=false;
  PM1.Items.Delete(2);
  PM1.Items.Delete(1);
  PM1.Items.Delete(0);
  RKeyRzBtnEdit4.Enabled := False;
  Memo1.Enabled := False;
  Memo4.Enabled := False;
  btnSave.Enabled := False;
  PM2.Items[0].Enabled := False;
end;

procedure TFrmDetail_Mod63.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  i:Integer;
begin
  inherited;
  case node.SelectedIndex of //打开相对应的页
    0..4:notebook1.PageIndex := node.SelectedIndex;
    5:notebook1.PageIndex := 0;
  else
    notebook1.PageIndex := 5;
  end;
  headercontrol1.Sections[1].Text := node.Text;
  if node.SelectedIndex > 5 then
  begin
    cds24.First;
    for i:=1 to node.SelectedIndex - 6 do
    begin
      cds24.Next; //翻到对应的装运记录
//      ShowMessage(IntToStr(Node.SelectedIndex));
    end;

    getshipdata;  //填写装运子表的国家和增值税信息
  end;
end;

procedure TFrmDetail_Mod63.TreeView1DblClick(Sender: TObject);
begin
  inherited;
  if (treeview1.Selected.SelectedIndex>5) and (cds24.ReadOnly <> True) then
    n2click(sender);
end;

procedure TFrmDetail_Mod63.TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  treeview1.PopupMenu := nil;
  if button = mbright then
    if treeview1.Selected.SelectedIndex = 5 then
    begin
      n1.Enabled := true;
      n2.Enabled := false;
      n3.Enabled := false;
      treeview1.PopupMenu := PM1;
    end
    else if treeview1.Selected.SelectedIndex > 5  then
    begin
      n1.Enabled := false;
      n2.Enabled := true;
      n3.Enabled := true;
      treeview1.PopupMenu := PM1;
    end
    else treeview1.PopupMenu := nil;
end;



end.
