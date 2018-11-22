unit addEquipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls, ExtCtrls, Grids,
  DBGridEh, Menus, DB, ADODB;

type
  TFrm_addEquipment = class(TForm)
    Panel1: TPanel;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Edit_FASSET_CODE: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    Label17: TLabel;
    Edit10: TEdit;
    Edit12: TEdit;
    Edit14: TEdit;
    Label19: TLabel;
    Label21: TLabel;
    Label18: TLabel;
    Edit11: TEdit;
    Label20: TLabel;
    Edit13: TEdit;
    Label22: TLabel;
    Edit15: TEdit;
    Edit8: TEdit;
    Label11: TLabel;
    EDT_FASSET_NAME: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit_FASSET_DESC: TEdit;
    Label16: TLabel;
    Edit9: TEdit;
    ComboBox3: TComboBox;
    Label15: TLabel;
    Edit_machine_number: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Edit_LOCATION: TEdit;
    Label23: TLabel;
    cbb_DeviType: TComboBox;
    cbb_D845_ptr: TComboBox;
    Label24: TLabel;
    Label13: TLabel;
    BitBtn3: TBitBtn;
    Edit5: TEdit;
    Label6: TLabel;
    Label5: TLabel;
    Cbb_FASSET_TYPE: TComboBox;
    Label8: TLabel;
    dtpkBudDay: TDateTimePicker;
    Label9: TLabel;
    Cbb_ABBR_NAME: TComboBox;
    Label25: TLabel;
    Cbb_d840_Location: TComboBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Memo1: TMemo;
    Label12: TLabel;
    Label14: TLabel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel4: TPanel;
    Panel3: TPanel;
    StringGrid2: TStringGrid;
    Panel5: TPanel;
    Button2: TButton;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    TabSheet3: TTabSheet;
    DBGridEh2: TDBGridEh;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    ADS812: TADODataSet;
    DS812: TDataSource;
    ADS812DeviType: TStringField;
    ADS812MainCycl: TStringField;
    ADS812cycl_duration: TIntegerField;
    ADS812AdvanceDays: TIntegerField;
    Splitter1: TSplitter;
    DBGridEh3: TDBGridEh;
    ADS820: TADODataSet;
    DS820: TDataSource;
    ADS820INV_PART_NUMBER: TStringField;
    ADS820INV_NAME: TStringField;
    ADS820INV_DESCRIPTION: TStringField;
    ADS820SetDate: TDateTimeField;
    ADS820rkey417: TIntegerField;
    ADS820rkey17: TIntegerField;
    ADS820MainCycl: TStringField;
    ADS820rkey73: TIntegerField;
    ADS820DeviType: TStringField;
    ADS820Quantity: TFloatField;
    ADS820USER_FULL_NAME: TStringField;
    ADS820IfMustReplace: TBooleanField;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    ADS820UNIT_NAME: TStringField;
    ADS820Unit_ptr: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure Cbb_FASSET_TYPEChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbb_DeviTypeChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbb_DeviTypeEnter(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGridEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure DS812DataChange(Sender: TObject; Field: TField);
    procedure ADS812AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
     strsql , FStrSql , FStr820:string;
     rkey417_1,rkey417list,rkey17_1,rkey17list:string;
     typename:TStringList;
     procedure post();
     procedure SaveMateriel(rkey417:Integer);
     function find_code(code:string):Boolean;
     function get_systemuser(rkey73:Integer):string;
  public
    { Public declarations }
    v_status:Integer;     //0新增;1编辑;2编辑位置备注;4检查
    procedure strsqlAssign(strsql_text:string);
    function returen_rkey417list():string;
    function returen_rkey17list():string;
  end;

var
  Frm_addEquipment: TFrm_addEquipment;
  const
  TmpFileDir = 'c:\tmp\';
implementation

uses damo,Pick_Item_Single,ConstVar,ShellAPI, MultiSelectItem,common,PubFunc,StrUtils,
  MaterielFrm;

{$R *.dfm}

procedure TFrm_addEquipment.FormShow(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,fasset_type from data0514');
    Open;
  end;
  DM.tmp.First;
  Cbb_FASSET_TYPE.Items.Clear;
  while not DM.tmp.Eof do             //设备类别
  begin
//    Cbb_FASSET_TYPE.Items.Add(DM.tmp.FieldValues['fasset_type']);
    Cbb_FASSET_TYPE.Items.AddObject(DM.tmp.FieldValues['fasset_type'],
                                  Pointer(DM.tmp.FieldByName('rkey').AsInteger));
    DM.tmp.Next;
  end;

  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,abbr_name from data0015');
    open;
  end;
  DM.tmp.First;
  Cbb_ABBR_NAME.Items.Clear;           //工厂
  while not DM.tmp.Eof do
  begin
    Cbb_ABBR_NAME.Items.AddObject(DM.tmp.FieldValues['abbr_name'],Pointer(DM.tmp.FieldByName('rkey').AsInteger));
    DM.tmp.Next;
  end;

  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,Location from data0840');
    open;
  end;
  DM.tmp.First;
  Cbb_d840_Location.Items.Clear;
  while not DM.tmp.Eof do            //责任小组
  begin
    Cbb_d840_Location.Items.AddObject(DM.tmp.FieldValues['Location'],Pointer(DM.tmp.FieldByName('rkey').AsInteger));
    DM.tmp.Next;
  end;

   TypeName:=tstringlist.Create;

  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select DeviType,TypeName from data0811 ');
    open;
  end;
  DM.tmp.First;
  cbb_DeviType.Items.Clear;
  TypeName.Clear;
  while not DM.tmp.Eof do           //保养类型
  begin
    cbb_DeviType.Items.Add(DM.tmp.FieldByName('DeviType').AsString);
    typename.Add(DM.tmp.FieldByName('TypeName').AsString);
//    cbb_DeviType.Tag :=  DM.tmp.FieldValues['TypeName'];
//   cbb_DeviType.Items.AddObject(DM.tmp.FieldValues['DeviType'],TObject(DM.tmp.FieldByName('TypeName').AsString));

    DM.tmp.Next;
  end;

  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,FaultDesc from data0845 ');
    open;
  end;
  DM.tmp.First;
  cbb_D845_ptr.Items.Clear;
  while not DM.tmp.Eof do          //故障类别
  begin
    cbb_D845_ptr.Items.AddObject(DM.tmp.FieldValues['FaultDesc'],Pointer(DM.tmp.FieldByName('rkey').AsInteger));
    DM.tmp.Next;
  end;

  dtpkBudDay.Date :=common.getsystem_date(dm.tmp,1);//购入日期 

  StringGrid2.Cells[0,0] :='设备编码';
  StringGrid2.Cells[1,0] :='设备名称';
  StringGrid2.Cells[2,0] :='规格型号';
  StringGrid2.Cells[3,0] :='设备级别';
  StringGrid2.Cells[4,0] :='设备类别';
  StringGrid2.Cells[5,0] :='保养类型';
  StringGrid2.Cells[6,0] :='使用部门';
  StringGrid2.Cells[7,0] :='具体位置';
  StringGrid2.Cells[8,0] :='状态';
  StringGrid2.Cells[9,0] :='工厂';
  StringGrid2.Cells[10,0]:='rkey';
  StringGrid2.ColWidths[10]:=-1;

  rkey417_1 :='';
  FStrSql := ADS812.CommandText;
  FStr820 := ADS820.CommandText;
  DM.ADS813.Close;
  dm.ADS813.Parameters[0].Value := 0;
  DM.ADS813.Open;
  PageControl1.ActivePageIndex:=0;
  if v_status <>0 then
  begin                          //设备档案文件
  DM.ADS813.Close;
  dm.ADS813.Parameters[0].Value :=  DM.ADS417RKEY.Value;
  DM.ADS813.Open;
  end;
end;

procedure TFrm_addEquipment.Cbb_FASSET_TYPEChange(Sender: TObject);
begin
//Label13.Caption := IntToStr(Integer(Cbb_FASSET_TYPE.Items.Objects[Cbb_FASSET_TYPE.ItemIndex]));
end;

procedure TFrm_addEquipment.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'DEPT_CODE/部门代码/150,DEPT_NAME/部门名称/200,ttype/类型/80';
    InputVar.Sqlstr := 'select rkey,DEPT_CODE,DEPT_NAME,'+
    'case ttype when ''1'' then ''工序'' when ''4'' then ''部门'' when ''5'' then ''班组'' end as ttype'+
    ' from Data0034  where ttype in (1,4) and ACTIVE_FLAG=0 ORDER by DEPT_CODE ';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit5.Text:=frmPick_Item_Single.adsPick.fieldbyname('DEPT_CODE').AsString;
      Edit5.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      Label13.Caption := frmPick_Item_Single.adsPick.FieldByName('DEPT_NAME').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end
end;

procedure TFrm_addEquipment.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  Button1.Enabled := True
  else
  Button1.Enabled := False;
end;

function TFrm_addEquipment.returen_rkey417list: string;
var
  i:Integer;
begin
  rkey417list :='(';
  for i:=1 to StringGrid2.RowCount-2 do
  if i = StringGrid2.RowCount-2 then
    rkey417list := rkey417list + StringGrid2.Cells[10,i]+')'
  else
    rkey417list := rkey417list + StringGrid2.Cells[10,i]+',';
  returen_rkey417list := rkey417list;

end;

procedure TFrm_addEquipment.Button1Click(Sender: TObject);
begin
  try
    frm_MultiSelectItem:=tfrm_MultiSelectItem.Create(Application);
    if StringGrid2.RowCount > 2 then
    begin
      if Trim(rkey417_1)='' then
        frm_MultiSelectItem.ADS417_1.CommandText := frm_MultiSelectItem.ADS417_1.CommandText
        + ' and Data0417.rkey not in' + Self.returen_rkey417list+'and DATA0417.Group_Ptr is null'
      else
        frm_MultiSelectItem.ADS417_1.CommandText := frm_MultiSelectItem.ADS417_1.CommandText
        + ' and Data0417.rkey not in' + Self.returen_rkey417list+'and ( DATA0417.Group_Ptr is null or Data0417.rkey in ('+rkey417_1+'))' ;
    end;

    if frm_MultiSelectItem.ShowModal=mrok then
    begin
      frm_MultiSelectItem.ADS417_1.First;
      while not  frm_MultiSelectItem.ADS417_1.Eof do
      begin
        StringGrid2.Cells[0,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1FASSET_CODE.Value;
        StringGrid2.Cells[1,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1FASSET_NAME.Value;
        StringGrid2.Cells[2,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1FASSET_DESC.Value;
        StringGrid2.Cells[3,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1equipment_grade.Value;
        StringGrid2.Cells[4,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1FASSET_TYPE.Value;
        StringGrid2.Cells[5,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1DeviType.Value;
        StringGrid2.Cells[6,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1DEPT_NAME.Value;
        StringGrid2.Cells[7,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1LOCATION.Value;
        StringGrid2.Cells[8,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1active_flag.Value;
        StringGrid2.Cells[9,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1ABBR_NAME.Value;
        StringGrid2.Cells[10,StringGrid2.RowCount-1] := frm_MultiSelectItem.ADS417_1RKEY.AsString;
        StringGrid2.RowCount := StringGrid2.RowCount+1;
        frm_MultiSelectItem.ADS417_1.Next;
      end;
    end;
    if StringGrid2.RowCount >2 then
      CheckBox2.Enabled :=False
    else
      CheckBox2.Enabled :=True;
  finally
    frm_MultiSelectItem.Free;
  end;
end;

function TFrm_addEquipment.find_code(code: string): Boolean;
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey from data0417 where FASSET_CODE='''+code+'''';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
    Result:=False
  else
    Result :=True;
end;

procedure TFrm_addEquipment.post();
begin
  with DM.ADO417 do
  begin
    FieldByName('FASSET_CODE').AsString := Edit_FASSET_CODE.Text;
    FieldByName('FASSET_NAME').AsString := EDT_FASSET_NAME.Text;
    FieldByName('FASSET_DESC').AsString := Edit_FASSET_DESC.Text;
    FieldByName('machine_number').AsString := Edit_machine_number.Text;
    FieldByName('location').AsString := Edit_LOCATION.Text;
    FieldByName('DEPT_PTR').AsInteger := Edit5.Tag;
    FieldByName('FASSET_TYPE_PTR').AsInteger := Integer(Cbb_FASSET_TYPE.Items.Objects[Cbb_FASSET_TYPE.ItemIndex]);
    FieldByName('PURCH_DATE').AsDateTime := dtpkBudDay.date;
    FieldByName('warehouse_ptr').AsInteger := Integer(Cbb_ABBR_NAME.Items.Objects[Cbb_ABBR_NAME.ItemIndex]);
    if Cbb_d840_Location.ItemIndex<>-1 then
      FieldByName('d840_ptr').AsInteger := Integer(Cbb_d840_Location.Items.Objects[Cbb_d840_Location.ItemIndex]);
    FieldByName('supplier_name').AsString := Edit7.Text;
    FieldByName('MAKE_VENDER').AsString := Edit8.Text;
    FieldByName('equipment_grade').AsString := ComboBox3.Text;
    FieldByName('DeviType').AsString := cbb_DeviType.Text;
    FieldByName('d845_ptr').AsInteger := Integer(cbb_D845_ptr.Items.Objects[cbb_D845_ptr.ItemIndex]);
    FieldByName('REMARK').AsString :=Memo1.Lines.Text;
    FieldByName('user_ptr').AsInteger := StrToInt(common.user_ptr);
    FieldByName('USER_DATE').AsDateTime :=getsystem_date(DM.tmp,1);
    if CheckBox2.Checked then
      FieldByName('IsGroup').Value:=1
    else
      FieldByName('IsGroup').Value:=0;
    if CheckBox3.Checked then
      FieldByName('EquiType').Value:=1
    else
      FieldByName('EquiType').Value:=0;
  end;

end;

procedure TFrm_addEquipment.strsqlAssign(strsql_text: string);
begin
  strsql :=  strsql_text;
end;

procedure TFrm_addEquipment.SaveMateriel(rkey417:Integer);
begin
 //以下为保养材料设置


    DM.tmp.Close;
    DM.tmp.SQL.Text := 'delete data0820 where rkey417 = ' +inttostr(rkey417);
    DM.tmp.ExecSQL;

  if not ads820.IsEmpty then
  begin
  ADS820.Filtered := False;
 { ADS820.First;
  while not ADS820.Eof do
  begin
    ADS820.Edit;
    ADS820.FieldByName('rkey417').Value := IntToStr(rkey417);
    ADS820.Post;
    ADS820.Next;
  end; }
  ADS820.First;
  while not ADS820.Eof do
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text := 'insert into data0820(rkey417,rkey17,DeviType,MainCycl,Quantity,IfMustReplace,rkey73,SetDate,unit_ptr)'+
                       ' values( '+IntToStr(rkey417)+','+ ADS820rkey17.AsString +','+
                       QuotedStr(ADS820DeviType.AsString)+','+ QuotedStr(ADS820MainCycl.AsString)+','+
                       ADS820Quantity.AsString+','+ QuotedStr(ADS820IfMustReplace.AsString)+','+
                       ADS820rkey73.AsString+','+ QuotedStr(ADS820SetDate.AsString)+','+ ADS820Unit_ptr.AsString+')';
    DM.tmp.ExecSQL;
    ADS820.Next;
  end;
  end;
end;

procedure TFrm_addEquipment.BitSaveClick(Sender: TObject);
var
  i,rkey:Integer;
  child_rkey,child_rkey1:string;
begin
  if Edit_FASSET_CODE.Text ='' then
  begin
    messagedlg('设备编码不能为空',mtinformation,[mbcancel],0);
    PageControl1.ActivePageIndex := 0;
    Edit_FASSET_CODE.SetFocus;
    exit;
  end;

  if EDT_FASSET_NAME.Text='' then
  begin
    MessageDlg('设备名称不能为空',mtInformation,[mbCancel],0);
    PageControl1.ActivePageIndex := 0;
    EDT_FASSET_NAME.SetFocus;
    Exit;
  end;

  if Cbb_FASSET_TYPE.Text='' then
  begin
    MessageDlg('设备类别不能为空',mtInformation,[mbCancel],0);
    PageControl1.ActivePageIndex := 0;
    Cbb_FASSET_TYPE.SetFocus;
    Exit;
  end;

  if Cbb_ABBR_NAME.Text='' then
  begin
    MessageDlg('工厂不能为空',mtInformation,[mbCancel],0);
    PageControl1.ActivePageIndex := 0;
    Cbb_ABBR_NAME.SetFocus;
    Exit;
  end;
 //以下为自定义不能为空
  if Edit5.Text='' then
  begin
    MessageDlg('使用部门不能为空',mtInformation,[mbCancel],0);
    PageControl1.ActivePageIndex := 0;
    Edit5.SetFocus;
    Exit;
  end;

  if ComboBox3.Text='' then
  begin
    MessageDlg('设备级别不能为空',mtInformation,[mbCancel],0);
    PageControl1.ActivePageIndex := 0;
    ComboBox3.SetFocus;
    Exit;
  end;

  if cbb_DeviType.Text=''then
  begin
    MessageDlg('保养类型不能为空',mtInformation,[mbCancel],0);
    PageControl1.ActivePageIndex := 0;
    cbb_DeviType.SetFocus;
    Exit;
  end;

  if cbb_D845_ptr.Text='' then
  begin
    MessageDlg('故障类别不能为空',mtInformation,[mbCancel],0);
    PageControl1.ActivePageIndex := 0;
    cbb_D845_ptr.SetFocus;
    Exit;
  end;

  if CheckBox3.Checked then
    if Cbb_d840_Location.Text='' then
    begin
      MessageDlg('如果是设备类型，责任小组不能为空',mtInformation,[mbCancel],0);
      PageControl1.ActivePageIndex := 0;
      Cbb_d840_Location.SetFocus;
      Exit;
    end;

  if v_status = 0  then
  begin
    if find_code(Edit_FASSET_CODE.Text)  then
    begin
      MessageDlg('设备编码重复',mtInformation,[mbCancel],0);
      PageControl1.ActivePageIndex := 0;
      Edit_FASSET_CODE.SetFocus;
      Exit;
    end;
    try
      DM.ADOConnection1.BeginTrans;
      DM.ADO417.Close;
      DM.ADO417.SQL.Text := strsql+'where rkey is null';
      DM.ADO417.Open;
      DM.ADO417.Append;
      post();
      DM.ADO417.Post;
      rkey:=DM.ADO417.FieldValues['rkey'];
    //  rkey417 := rkey;
      SaveMateriel(rkey);
      if  stringgrid2.RowCount>2 then
      begin
        for i:=1 to stringgrid2.RowCount-2 do
        if i <> stringgrid2.RowCount-2 then
          child_rkey:=child_rkey+ stringgrid2.Cells[10,i]+','
        else
          child_rkey:=child_rkey+ stringgrid2.Cells[10,i];
        With dm.tmp do
        begin
          close;
          sql.Text:='update  data0417 set Group_Ptr='+inttostr(rkey)+' where rkey in('+child_rkey+')';
          ExecSQL;
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end;
  end
  else if (v_status=1) or (v_status=2) then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      DM.ADO417.Close;
      DM.ADO417.SQL.Text := strsql+' where rkey ='+dm.ADS417RKEY.Text;
      DM.ADO417.Open;
      DM.ADO417.Edit;
      self.post();
      DM.ADO417.Post;
      rkey:=DM.ADO417.FieldValues['rkey'];
     // rkey417 := rkey;
      SaveMateriel(rkey);
      With dm.tmp do
      begin
        close;
        sql.Text:='update  data0417 set  Group_Ptr= null  where Group_Ptr ='+inttostr(rkey);
        ExecSQL;
      end;
      if  stringgrid2.RowCount>2 then
      begin
        for i:=1 to stringgrid2.RowCount-2 do
        if i <> stringgrid2.RowCount-2 then
          child_rkey1:=child_rkey1+ stringgrid2.Cells[10,i]+','
        else
          child_rkey1:=child_rkey1+ stringgrid2.Cells[10,i];
        With dm.tmp do
        begin
          close;
          sql.Text:='update  data0417 set Group_Ptr='+inttostr(rkey)+' where rkey in('+child_rkey1+')';
          ExecSQL;
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end;
  end;
end;

procedure TFrm_addEquipment.Edit5Exit(Sender: TObject);
begin
  if(Trim(Edit5.Text))<>'' then
  with dm.tmp do
  begin
    close;
    sql.Text:='select rkey,DEPT_NAME from data0034 where DEPT_CODE='''+trim(edit5.Text)+'''';
    open;
    if isempty then
    begin
     showmessage('使用部门不存在，请输入正确的使用部门');
     edit5.Text:='';
     Label13.Caption :='';
     edit5.SetFocus;
    end
    else
    begin
      Edit5.Tag := FieldByName('rkey').Value;
      Label13.Caption := FieldByName('DEPT_NAME').Value;
    end;
  end
  else
    Label13.Caption :='';
end;

procedure TFrm_addEquipment.Button2Click(Sender: TObject);
var
  i,y:Integer;
  rkeysg :string;
begin
  //此代码为去除 rkey417list里面的值重复添加。leftstr函数要引用StrUtils
  rkeysg:=StringGrid2.Cells[10,StringGrid2.row];
  y := Pos(rkeysg,rkey417list);
  rkey417list := leftstr(rkey417list,y)+copy(rkey417list,(y+length(rkeysg)+1),Length(rkey417list));

  if Trim(rkey417_1)=''then
    rkey417_1 := StringGrid2.Cells[10,StringGrid2.row]
  else
  begin
   if Pos(rkeysg,rkey417_1)>0  then
     rkey417_1 :=rkey417_1
   else
     rkey417_1 :=rkey417_1+','+StringGrid2.Cells[10,StringGrid2.row];
  end;

  if StringGrid2.RowCount <= 2 then Exit;
  for i:= StringGrid2.Row to StringGrid2.RowCount-2 do
  begin
    StringGrid2.Rows[i].Text := StringGrid2.Rows[i+1].Text;
  end;

  StringGrid2.RowCount :=StringGrid2.RowCount-1;

  if StringGrid2.Row=StringGrid2.RowCount-1 then
  StringGrid2.Row :=1;
  if StringGrid2.RowCount >2 then
    CheckBox2.Enabled :=False
  else
    CheckBox2.Enabled :=True;
end;

procedure TFrm_addEquipment.FormActivate(Sender: TObject);
begin
  if (v_status=1) or (v_status=2) or (v_status=4) then
  begin
    with DM.ADS417 do
    begin
      Edit_FASSET_CODE.Text := FieldByName('FASSET_CODE').AsString ;
      EDT_FASSET_NAME.Text := FieldByName('FASSET_NAME').AsString ;
      Edit_FASSET_DESC.Text := FieldByName('FASSET_DESC').AsString ;
      Edit_machine_number.Text := FieldByName('machine_number').AsString ;
      Edit_LOCATION.Text := FieldByName('location').AsString  ;
      Edit5.Text := FieldByName('DEPT_CODE').AsString;
      Label13.Caption := FieldByName('DEPT_NAME').AsString;
      Edit5.Tag :=  FieldByName('DEPT_PTR').AsInteger;
      Cbb_FASSET_TYPE.ItemIndex := Cbb_FASSET_TYPE.Items.IndexOf(FieldByName('FASSET_TYPE').AsString);
      dtpkBudDay.date := FieldByName('PURCH_DATE').AsDateTime ;
      Cbb_ABBR_NAME.ItemIndex := Cbb_ABBR_NAME.Items.IndexOf(FieldByName('ABBR_NAME').AsString);
      if DM.ADS417D840_ptr.Value = Null then
        Exit
      else
      Cbb_d840_Location.ItemIndex := Cbb_d840_Location.Items.IndexOf(FieldByName('d840_Location').AsString);
      Edit7.Text := FieldByName('supplier_name').AsString  ;
      Edit8.Text := FieldByName('MAKE_VENDER').AsString;
      Edit9.Text := FieldByName('BOOK_DATE').AsString;
      ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(FieldByName('equipment_grade').AsString);

      cbb_DeviType.ItemIndex := cbb_DeviType.Items.IndexOf(FieldByName('DeviType').AsString);

      Label14.Caption := typename.Strings[cbb_DeviType.ItemIndex];


      cbb_D845_ptr.ItemIndex := cbb_D845_ptr.Items.IndexOf(FieldByName('FaultDesc').AsString);
      Memo1.Lines.Text := FieldByName('REMARK').AsString ;
      Edit11.Text := FieldByName('EMPLOYEE_NAME').AsString;
      Edit10.Text := FieldByName('USER_DATE').Value ;
      if DM.ADS417DATA0417active_flag.Value<>1  then
      begin
        if FieldByName('confi_user').AsString<>'' then
          Edit13.Text := FieldByName('confi_user').AsString;
        if FieldByName('confi_date').Value <>null then
          Edit12.Text := FieldByName('confi_date').Value;
      end;
      if (DM.ADS417DATA0417active_flag.Value<>2) and (DM.ADS417DATA0417active_flag.Value<>1) then
      begin
        if FieldByName('install_user').AsString<>'' then
          Edit15.Text := FieldByName('install_user').AsString;
        if FieldByName('install_date').Value <>null then
          Edit14.Text := FieldByName('install_date').Value;
      end;

      if  DM.ADS417IsGroup.AsString='是' then
      begin
        CheckBox2.Checked :=True;
        Button1.Enabled := True;
      end
      else
      begin
        CheckBox2.Checked :=False;
        Button1.Enabled := False;
      end;

      CheckBox3.Checked := DM.ADS417EquiType.AsBoolean;
    end;
    with  DM.tmp do
    begin
      Close;
      SQL.Text := 'SELECT DATA0417.RKEY,DATA0417.FASSET_CODE ,DATA0417.FASSET_NAME,'+
      'DATA0417.FASSET_DESC,Data0514.FASSET_TYPE,equipment_grade,Data0034.DEPT_NAME,DATA0417.LOCATION,'+
      'case DATA0417.active_flag when 1 then ''新进'' when 2 then ''仓库确认'' when 3 then ''安装完成'''+
      ' when 4 then ''验收合格'' when 5 then ''报废'' when 6 then ''调拨外出'' when 7 then ''闲置'' end AS active_flag,'+
      'Data0015.ABBR_NAME,DeviType '+
      'FROM DATA0417 LEFT JOIN Data0514 ON DATA0417.FASSET_TYPE_PTR =Data0514.RKEY '+
      'LEFT JOIN Data0034 ON DATA0417.DEPT_PTR = Data0034.RKEY '+
      'LEFT OUTER JOIN Data0015 ON DATA0417.warehouse_ptr = Data0015.RKEY '+
      'WHERE Data0417.active_flag in (1,2,3,4) and IsGroup=0  and data0417.Group_Ptr='+inttostr(DM.ADS417RKEY.Value);
      Open;
      First;
      while not  Eof do
      begin
        StringGrid2.Cells[0,StringGrid2.RowCount-1] := FieldByName('FASSET_CODE').AsString;
        StringGrid2.Cells[1,StringGrid2.RowCount-1] := FieldByName('FASSET_NAME').AsString;
        StringGrid2.Cells[2,StringGrid2.RowCount-1] := FieldByName('FASSET_DESC').AsString;
        StringGrid2.Cells[3,StringGrid2.RowCount-1] := FieldByName('equipment_grade').AsString;
        StringGrid2.Cells[4,StringGrid2.RowCount-1] := FieldByName('FASSET_TYPE').AsString;
        StringGrid2.Cells[5,StringGrid2.RowCount-1] := FieldByName('DeviType').AsString;
        StringGrid2.Cells[6,StringGrid2.RowCount-1] := FieldByName('DEPT_NAME').AsString;
        StringGrid2.Cells[7,StringGrid2.RowCount-1] := FieldByName('LOCATION').AsString;
        StringGrid2.Cells[8,StringGrid2.RowCount-1] := FieldByName('active_flag').AsString;
        StringGrid2.Cells[9,StringGrid2.RowCount-1] := FieldByName('ABBR_NAME').AsString;
        StringGrid2.Cells[10,StringGrid2.RowCount-1] := FieldByName('RKEY').AsString;
        StringGrid2.RowCount := StringGrid2.RowCount+1;
        Next;
      end;
    end;
    if StringGrid2.RowCount >2 then
      CheckBox2.Enabled :=False
    else
      CheckBox2.Enabled :=True;

    ADS820.Close;
    ADS820.CommandText := FStr820 + ' and Data0820.rkey417='+dm.ADS417RKEY.AsString;
    ADS820.Open;
    cbb_DeviType.Enabled:=ADS820.IsEmpty;
    ADS820.Close;
  end;

  if (v_status=2) or (v_status=4) then
  begin
    Edit_FASSET_CODE.Enabled := False;
    EDT_FASSET_NAME.Enabled := False;
    Edit_FASSET_DESC.Enabled := False;
    Edit_machine_number.Enabled := False;
    Edit5.Enabled := False;
    BitBtn3.Enabled := False;
    Cbb_FASSET_TYPE.Enabled :=False;
    Cbb_ABBR_NAME.Enabled := False;
    dtpkBudDay.Enabled := False;
    CheckBox2.Enabled := False;
    CheckBox3.Enabled := False;
    Button1.Enabled := False;
    Button2.Enabled := False;
  end
  else
  begin
    Edit_FASSET_CODE.Enabled := True;
    EDT_FASSET_NAME.Enabled := True;
    Edit_FASSET_DESC.Enabled := True;
    Edit_machine_number.Enabled := True;
    Edit5.Enabled := True;
    BitBtn3.Enabled := True;
    Cbb_FASSET_TYPE.Enabled :=True;
    Cbb_ABBR_NAME.Enabled := True;
    dtpkBudDay.Enabled := True;
  end;
  if v_status=4 then
  begin
   BitSave.Enabled := False;
   Edit_LOCATION.Enabled := False;
   Cbb_d840_Location.Enabled := False;
   Edit7.Enabled := False;
   Edit8.Enabled := False;
   ComboBox3.Enabled := False;
   cbb_DeviType.Enabled := False;
   cbb_D845_ptr.Enabled := False;
   Memo1.Enabled := False;

  end
  else
  begin
    BitSave.Enabled := True;
    Edit_LOCATION.Enabled := True;
    Cbb_d840_Location.Enabled := True;
    Edit7.Enabled := True;
    Edit8.Enabled := True;
    ComboBox3.Enabled := True;

    cbb_D845_ptr.Enabled := True;
    Memo1.Enabled := True;

  end;



end;

procedure TFrm_addEquipment.cbb_DeviTypeChange(Sender: TObject);
begin
{  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select DeviType,TypeName from data0811 where DeviType='+QuotedStr(cbb_DeviType.Text);
    open;
  end;
  if cbb_DeviType.Text <> '' then
    Label14.Caption := DM.tmp.FieldByName('TypeName').Value
  else
    Label14.Caption :='';
 }

     Label14.Caption := typename.Strings[cbb_DeviType.ItemIndex];

  ADS812.Close;
  ADS812.CommandText := FStrSql + ' and DeviType = ' + QuotedStr(Trim(cbb_DeviType.Text));
  ADS812.Open;

 {
  ADS820.Close;
  ADS820.CommandText := FStr820 + 'and Data0820.DeviType = ' + QuotedStr(Trim(cbb_DeviType.Text))+
                        ' and Data0820.rkey417='+dm.ADS417RKEY.AsString;
  ADS820.Open;
  }

end;

procedure TFrm_addEquipment.N1Click(Sender: TObject);
var
  f: string;
  fs: TMemoryStream;
begin
  with   dm.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select VCUT_BMP,file_name from data0813 where file_name='+quotedstr(dm.ADS813file_name.AsString)
    +' and  fasset_ptr='+inttostr(DM.ADS813FASSET_PTR.value);
    Open;

    fs:=TMemoryStream.Create;
    TBlobfield(FieldByName('VCUT_BMP')).SaveToStream(fs);
    if not DirectoryExists(TmpFileDir) then
      if not CreateDir(TmpFileDir) then
        raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
    UnPackStream(fs);
    f:=TmpFileDir+FieldByName('file_name').AsString;
    fs.SaveToFile(f);
    fs.Free;
    ShellExecute(0,'open',pchar(f),nil,nil,SW_SHOWNORMAL);
  end;

end;

procedure TFrm_addEquipment.N2Click(Sender: TObject);
var i:integer;
//    y:integer;
    s,file_name,FASSET_PTR:string;
    fs: TMemoryStream;
    indate:TDateTime;
begin
  OpenDialog1.DefaultExt :='*.*';
  OpenDialog1.Filter :='';
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if OpenDialog1.FileName[i]<>'\' then
        s:=OpenDialog1.FileName[i]+s
      else
        break;
    end;
    fs := TMemoryStream.Create;
    fs.LoadFromFile(OpenDialog1.FileName);
    if fs.Size>10*1024*1024 then
    begin
      showmessage('文件大小不能超过10M,请重新整理文件再保存...');
      fs.Free;
      exit;
    end;
    PackStream(fs);

    if s <> '' then
    with DBGridEh1.DataSource.DataSet do
    begin
      if Locate('file_name',s,[]) then  //如果上传的文件已经存在。
        begin
          if Messagedlg('文件名:'+S+'已经存在,确定需要覆盖吗？',mtconfirmation,[mbYES,mbNO],0)=mrNo  then
            Exit;
          begin
            try
              DM.ADOConnection1.BeginTrans;
              with DM.Tmp do
              begin
                SQL.Clear;
                SQL.Add('update data0813 '+
                'set VCUT_BMP=:file_data_s from data0813 where [file_name]= '''+s+''' and FASSET_PTR='+inttostr(DM.ADS417RKEY.Value) );
                Parameters.ParamByName('file_data_s').LoadFromStream(fs,ftBlob);
                ExecSQL;
              end;
              Edit;
              FieldByName('user_ptr').Value:=user_ptr;
              FieldByName('in_date').Value:=GetSystem_Date(DM.Tmp,0);
              Post;
              DM.ADOConnection1.CommitTrans;
              Refresh;
              fs.Free;
              showmessage('文件修改成功!!!');

            except
              on e: exception do
              begin
                DM.ADOConnection1.RollbackTrans;         //回滚事务
                Cancel;
                showmessage('文件上传失败,原因是：'+e.message);
                fs.Free;
              end;
            end;
          end ;
        end
      else     //如果不存在，添加
      begin

        try

          try
            indate := getsystem_date(DM.tmp,0);
            DM.ADOConnection1.BeginTrans;
            with DM.tmp do
            begin
              Close;
              SQL.Text := 'SELECT DATA0813.FASSET_PTR,DATA0813.user_ptr,DATA0813.in_date,DATA0813.file_name,DATA0813.remark'+
                   ' FROM  dbo.DATA0813 where DATA0813.FASSET_PTR is null ' ;

              Open;
              Append;
              FieldByName('FASSET_PTR').Value:=DM.ADS417RKEY.Value;
              FieldByName('user_ptr').Value:=user_ptr;
              FieldByName('in_date') .Value:=indate;
              FieldByName('file_name') .Value:=s;
              Post;
              FASSET_PTR := FieldByName('FASSET_PTR') .Value;
              file_name := FieldByName('file_name') .Value;
            end;
            with DM.Tmp do
            begin
              SQL.Clear;
              SQL.Add('update data0813 '+
              'set VCUT_BMP=:file_data_s from data0813 where [file_name]= '''+s+''' and FASSET_PTR='+inttostr(DM.ADS417RKEY.Value) );
              Parameters.ParamByName('file_data_s').LoadFromStream(fs,ftBlob);
              ExecSQL;
            end;
            DM.ADOConnection1.CommitTrans;
          except
            on e: exception do
            begin
              DM.ADOConnection1.RollbackTrans;
              Cancel;
              showmessage('新建文件目录失败,原因是：'+e.message);
              Exit;
            end;
          end;

          fs.Free;

          DM.ADS813.Close;
          DM.ADS813.Open;
          DM.ADS813.Locate('FASSET_PTR;file_name',VarArrayOf([FASSET_PTR,file_name]),[loPartialKey]);
          showmessage('文件上传成功!!!');
        except
          on e: exception do
          begin
            DM.ADOConnection1.RollbackTrans;         //回滚事务
            Cancel;
            showmessage('文件上传失败,原因是：'+e.message);
            fs.Free;
          end;
        end;

      end;
    end;
    if s='' then showmessage('文件为空');
  end;

end;

procedure TFrm_addEquipment.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS813.CommandText);
end;

procedure TFrm_addEquipment.PopupMenu1Popup(Sender: TObject);
begin
  if (DM.ADS813.IsEmpty) then
  begin
    N1.Enabled := False;
    N3.Enabled := False;
    N4.Enabled := False;
  end
  else
  begin
    N1.Enabled := True;
    N3.Enabled := True;
    N4.Enabled := True;
  end;
  if (v_status =0) or (v_status=4)  or(StrToInt(vprev) in[1,3]) then
  begin
    N2.Enabled := False;
    N3.Enabled := False;
    N4.Enabled :=False;
  end;
 
end;

procedure TFrm_addEquipment.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
// if not (key in ['0'..'9','.',#8,#13]) then abort//判断是否输入数字
//
// else
// if key = chr(46) then
// if pos('.',editor1.Cells[1,editor1.row])>0then abort;//第二列小数点'.'不能重复
//if (Key in [#25]) and (Key in [#127]) then
//Abort;
end;

procedure TFrm_addEquipment.N3Click(Sender: TObject);
var      //  filename,
  f: string;
  fs: TMemoryStream;
begin
  with dm.Tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select VCUT_BMP,file_name from data0813 where [file_name]='+quotedstr(dm.ADS813file_name.AsString)
    +' and  fasset_ptr='+inttostr(DM.ads813FASSET_PTR.value);
    Open;
    fs:=TMemoryStream.Create;
    TBlobfield(FieldByName('VCUT_BMP')).SaveToStream(fs);
    savedialog1.FileName:=FieldByName('file_name').AsString;
    SaveDialog1.Filter :='*.*';
    if SaveDialog1.Execute then
    begin
      UnPackStream(fs);
      f:=savedialog1.FileName;
      fs.SaveToFile(f);
      application.MessageBox('文件保存成功!','提示!',64);
    end;
    fs.Free;
  end;

end;

procedure TFrm_addEquipment.N4Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除此文档吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  with DM.tmp do
  begin
    Close;
    SQL.Text :='delete data0813 where data0813.fasset_ptr='+dm.ADS813FASSET_PTR.AsString+' and file_name='+quotedstr(dm.ADS813file_name.Value);
    if ExecSQL>0 then
    begin
      common.ShowMsg('删除操作成功！',1);
      DM.ADS813.Close;
      DM.ADS813.Open;
    end;
  end;
end;

procedure TFrm_addEquipment.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.TabIndex=2) and (Trim(cbb_DeviType.Text) <> '')
     and (not ADS812.Active) then
  begin
   ADS812.Close;
   ADS812.CommandText := FStrSql + ' and DeviType = ' + QuotedStr(Trim(cbb_DeviType.Text));
   ADS812.Open;
  end;
end;

procedure TFrm_addEquipment.PopupMenu2Popup(Sender: TObject);
begin
  N5.Enabled := (not ADS812.IsEmpty) and (v_status <> 4);
end;

procedure TFrm_addEquipment.PopupMenu3Popup(Sender: TObject);
begin
  N6.Enabled := (not ADS820.IsEmpty) and (v_status <> 4) ;
end;

procedure TFrm_addEquipment.DBGridEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS812.CommandText);
end;

procedure TFrm_addEquipment.DBGridEh3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS820.CommandText);
end;

procedure TFrm_addEquipment.cbb_DeviTypeEnter(Sender: TObject);
begin
//  if not ((Trim(cbb_DeviType.Text) = '') or (ADS820.IsEmpty)) then
//  if Messagedlg('警告：保养类型更换将导致周期保养所需材料设置全部清空，是否更换？',mtconfirmation,[mbYES,mbNO],0)=mrNo  then
//     TabSheet1.SetFocus ;
{  ADS820.Filtered := False;
  if not (Trim(cbb_DeviType.Text) = '')  then
    if not ADS820.IsEmpty then
    begin
      ShowMessage('周期保养所需材料设置不为空，不能更换保养类型，请删除后再更换');
      PageControl1.ActivePageIndex := 2;
    end;
  ADS820.Filtered := True;
 } 
end;

function TFrm_addEquipment.returen_rkey17list: string;
begin
  rkey17list :='(';
  ADS820.First;
  while not ADS820.Eof do
  begin
    if ADS820.RecNo=ADS820.RecordCount then
    begin
      rkey17list := rkey17list + ADS820rkey17.AsString + ')';
    end
    else
    begin
      rkey17list := rkey17list + ADS820rkey17.AsString+',';
    end;
    ADS820.Next;
  end;
  returen_rkey17list := rkey17list;
end;

function TFrm_addEquipment.get_systemuser(rkey73: Integer): string;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text :='select USER_FULL_NAME,USER_LOGIN_NAME from data0073 where rkey='+inttostr(rkey73);
    Open;
    if IsEmpty then
     Result:=''
    else
     Result:=fieldbyname('USER_FULL_NAME').AsString;
  end;
end;


procedure TFrm_addEquipment.N5Click(Sender: TObject);
begin
  try
    Frm_Materiel:=TFrm_Materiel.Create(Application);
    if not ADS820.IsEmpty then
    begin
      if Trim(rkey17_1)='' then
        Frm_Materiel.ADS17.CommandText := Frm_Materiel.ADS17.CommandText
        + ' and Data0017.rkey not in' + Self.returen_rkey17list
      else
        Frm_Materiel.ADS17.CommandText := Frm_Materiel.ADS17.CommandText
        + ' and Data0017.rkey not in' + Self.returen_rkey17list ;
    end;

    if Frm_Materiel.ShowModal=mrok then
    begin
      Frm_Materiel.ADS17.First;
      while not Frm_Materiel.ADS17.Eof do
      begin
        ADS820.Append;

        ADS820.FieldByName('INV_PART_NUMBER').Value := Frm_Materiel.ADS17INV_PART_NUMBER.Value;
        ADS820.FieldByName('INV_NAME').Value := Frm_Materiel.ADS17INV_NAME.Value;
        ADS820.FieldByName('INV_DESCRIPTION').Value := Frm_Materiel.ADS17INV_DESCRIPTION.Value;
        ADS820.FieldByName('unit_name').Value := Frm_Materiel.ADS17UNIT_NAME.Value;
        ADS820USER_FULL_NAME.Value:=self.get_systemuser(StrToInt(rkey73));

        if self.v_status<>0then
         ADS820rkey417.Value:=dm.ADS417RKEY.Value
        else
         ADS820rkey417.Value:=0;
        ADS820.FieldByName('rkey17').Value := Frm_Materiel.ADS17RKEY.Value;
        ADS820.FieldByName('DeviType').Value := ADS812DeviType.Value;
        ADS820.FieldByName('MainCycl').Value := ADS812MainCycl.Value;
        ADS820.FieldByName('quantity').Value := 1;
        ADS820.FieldByName('IfMustReplace').Value := 0;
        ADS820.FieldByName('rkey73').Value := rkey73;
        ADS820.FieldByName('SetDate').Value := common.getsystem_date(DM.tmp,0);
        ADS820.FieldByName('unit_ptr').Value := Frm_Materiel.ADS17STOCK_UNIT_PTR.Value;

        ADS820.Post;
        Frm_Materiel.ADS17.Next;
      end;
      cbb_DeviType.Enabled:=False;
    end;
  finally
    Frm_Materiel.Free;
  end;
end;

procedure TFrm_addEquipment.N6Click(Sender: TObject);
var

  v_filter:string;
begin
  if MessageDlg('您确定要删除材料吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    ADS820.Delete;
    v_filter:=ADS820.Filter;
    ADS820.Filter := '';
    cbb_DeviType.Enabled:=ADS820.IsEmpty;
    ADS820.Filter := v_filter;
  end;
end;


procedure TFrm_addEquipment.DS812DataChange(Sender: TObject;
  Field: TField);
begin
  ADS820.Filter := 'MainCycl = '+ QuotedStr(ADS812MainCycl.AsString);  
end;

procedure TFrm_addEquipment.ADS812AfterOpen(DataSet: TDataSet);
begin
 if not ADS820.Active then
  begin
   ADS820.Close;
   if self.v_status<>0 then
    ADS820.CommandText := FStr820 + ' and Data0820.rkey417='+dm.ADS417RKEY.AsString
   else
    ADS820.CommandText := FStr820 + ' and Data0820.rkey417=0';
   ADS820.Open;
  end;
end;

end.
