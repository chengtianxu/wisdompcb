unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, DB, ADODB, DBClient, Provider,
  Grids, DBGridEh, ImgList, Buttons, StdCtrls, Menus, DBCtrls, Mask,
  DBCtrlsEh;
type
  TDropDownInfo=class
  private
  protected
  public
    L_GridName:       TDBGridEh;         //添加下拉列表将创建在哪个表格名上
    L_ListDataSetName:TDataSet;    //下拉列表数据集名
    L_DropdownColumn:string;             //添加下拉列表的表格列名
    L_ListDataSetFilterField:string;     // 下拉列表数据集过滤字段名，
    L_GetValueField :string;             //获取值的字段名
    L_ListResultField :string;           //下拉列表数据集返回的字段名     AnsiString
    L_FormWidth:Integer;                 //下拉窗体的宽度
    L_FormHeight:Integer;                //下拉窗体的高度
    L_FormType:Integer;                  //下拉窗体的类型 1:单选窗口，2：多选窗口
  end;
type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    TreeView1: TTreeView;
    PageControl1: TPageControl;
    sheet_Floor: TTabSheet;
    TabSheet2: TTabSheet;
    StatusBar1: TStatusBar;
    dsp_Dormitorymsg: TDataSetProvider;
    dsp_Bedroommsg: TDataSetProvider;
    dsp_Bedroommsg_count: TDataSetProvider;
    dsp_Bedmsg: TDataSetProvider;
    cds_Dormitorymsg: TClientDataSet;
    cds_Bedroommsg: TClientDataSet;
    cds_Bedroommsg_count: TClientDataSet;
    cds_Bedmsg: TClientDataSet;
    cds_Dormitorymsgrkey: TAutoIncField;
    cds_DormitorymsgD_code: TStringField;
    cds_DormitorymsgD_name: TWideStringField;
    cds_DormitorymsgD_floor: TIntegerField;
    cds_Dormitorymsgremark: TWideStringField;
    cds_Dormitorymsgwater_price: TFloatField;
    cds_Dormitorymsgelectricity_price: TFloatField;
    ds_Dormitorymsg: TDataSource;
    ds_Bedroommsg: TDataSource;
    ds_Bedroommsg_count: TDataSource;
    ds_Bedmsg: TDataSource;
    dgh_Dormitorymsg: TDBGridEh;
    cds_Dormitorymsgeffective: TBooleanField;
    il1: TImageList;
    cds_BedroommsgD_name: TWideStringField;
    cds_Bedroommsgrkey: TAutoIncField;
    cds_Bedroommsgdormitoryid: TIntegerField;
    cds_BedroommsgR_code: TStringField;
    cds_Bedroommsgbedcount: TIntegerField;
    cds_Bedroommsgfloor: TIntegerField;
    cds_Bedroommsgtype: TIntegerField;
    cds_Bedroommsggrade: TWideStringField;
    cds_Bedroommsgmonitor: TIntegerField;
    cds_Bedroommsgremark: TWideStringField;
    cds_BedroommsgR_name: TWideStringField;
    cds_Bedroommsgbasic_rent: TBCDField;
    cds_Bedroommsgelectricity_standard: TFloatField;
    cds_Bedroommsgwater_standard: TFloatField;
    cds_Bedroommsgeffective: TIntegerField;
    Panel3: TPanel;
    Panel4: TPanel;
    dgh_Bedroommsg: TDBGridEh;
    Splitter1: TSplitter;
    dgh_Bedmsg: TDBGridEh;
    Label1: TLabel;
    cds_Bedroommsgchinesename: TWideStringField;
    cds_Bedmsgchinesename: TWideStringField;
    cds_Bedmsgemployeecode: TWideStringField;
    cds_Bedmsgfactoryarea: TWideStringField;
    cds_Bedmsgdepartmentname: TWideStringField;
    cds_Bedmsgposition: TWideStringField;
    cds_Bedmsgondutytime: TWideStringField;
    cds_Bedmsgrkey: TAutoIncField;
    cds_Bedmsgbedroomid: TIntegerField;
    cds_BedmsgB_code: TStringField;
    cds_Bedmsgemployeeid: TIntegerField;
    cds_Bedmsgremark: TWideStringField;
    cds_Bedmsgeffective: TIntegerField;
    cds_Dormitorymsgtc: TStringField;
    cds_Bedroommsg_countdormitoryid: TIntegerField;
    cds_Bedroommsg_countfloor: TIntegerField;
    cds_Bedroommsg_counttc: TStringField;
    cds_Bedroommsgemployeecode: TWideStringField;
    AQ_Dormitorymsg: TADOQuery;
    AQ_Dormitorymsgrkey: TAutoIncField;
    AQ_DormitorymsgD_code: TStringField;
    AQ_DormitorymsgD_name: TWideStringField;
    AQ_DormitorymsgD_floor: TIntegerField;
    AQ_Dormitorymsgremark: TWideStringField;
    AQ_Dormitorymsgwater_price: TFloatField;
    AQ_Dormitorymsgelectricity_price: TFloatField;
    AQ_Dormitorymsgeffective: TBooleanField;
    AQ_Dormitorymsgtc: TStringField;
    AQ_Bedroommsg: TADOQuery;
    AQ_Bedroommsgemployeecode: TWideStringField;
    AQ_Bedroommsgchinesename: TWideStringField;
    AQ_BedroommsgD_name: TWideStringField;
    AQ_Bedroommsgrkey: TAutoIncField;
    AQ_Bedroommsgdormitoryid: TIntegerField;
    AQ_BedroommsgR_code: TStringField;
    AQ_Bedroommsgbedcount: TIntegerField;
    AQ_Bedroommsgfloor: TIntegerField;
    AQ_Bedroommsgtype: TIntegerField;
    AQ_Bedroommsggrade: TWideStringField;
    AQ_Bedroommsgmonitor: TIntegerField;
    AQ_Bedroommsgremark: TWideStringField;
    AQ_Bedroommsgeffective: TIntegerField;
    AQ_BedroommsgR_name: TWideStringField;
    AQ_Bedroommsgbasic_rent: TBCDField;
    AQ_Bedroommsgelectricity_standard: TFloatField;
    AQ_Bedroommsgwater_standard: TFloatField;
    AQ_Bedroommsg_count: TADOQuery;
    AQ_Bedroommsg_countdormitoryid: TIntegerField;
    AQ_Bedroommsg_countfloor: TIntegerField;
    AQ_Bedroommsg_counttc: TStringField;
    AQ_Bedmsg: TADOQuery;
    AQ_Bedroommsgequipment_remark: TWideStringField;
    cds_Bedroommsgequipment_remark: TWideStringField;
    cds_BedmsgProvince: TWideStringField;
    cds_Bedmsgbirthday: TWideStringField;
    cds_Bedmsgphone: TWideStringField;
    AQ_Bedmsgchinesename: TWideStringField;
    AQ_Bedmsgemployeecode: TWideStringField;
    AQ_Bedmsgfactoryarea: TWideStringField;
    AQ_Bedmsgdepartmentname: TWideStringField;
    AQ_Bedmsgposition: TWideStringField;
    AQ_Bedmsgondutytime: TWideStringField;
    AQ_BedmsgProvince: TWideStringField;
    AQ_Bedmsgbirthday: TWideStringField;
    AQ_Bedmsgphone: TWideStringField;
    AQ_Bedmsgrkey: TAutoIncField;
    AQ_Bedmsgbedroomid: TIntegerField;
    AQ_BedmsgB_code: TStringField;
    AQ_Bedmsgemployeeid: TIntegerField;
    AQ_Bedmsgremark: TWideStringField;
    AQ_Bedmsgeffective: TIntegerField;
    AQ_BedmsgR_code: TStringField;
    AQ_BedmsgR_name: TWideStringField;
    cds_BedmsgR_code: TStringField;
    cds_BedmsgR_name: TWideStringField;
    cds_Copy: TClientDataSet;
    PopupMenu_Dormitorymsg: TPopupMenu;
    N1_See: TMenuItem;
    N1_Append: TMenuItem;
    N1_Edit: TMenuItem;
    PopupMenu_Bedroommsg: TPopupMenu;
    N2_See: TMenuItem;
    N2_Append: TMenuItem;
    N2_Edit: TMenuItem;
    PopupMenu_Bedmsg: TPopupMenu;
    N3_See: TMenuItem;
    N3_Append: TMenuItem;
    N3_Edit: TMenuItem;
    N1_Delete: TMenuItem;
    N2_delete: TMenuItem;
    N3_Delete: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cds_DormitorymsgAfterInsert(DataSet: TDataSet);
    procedure cds_DormitorymsgAfterScroll(DataSet: TDataSet);
    procedure TreeView1Click(Sender: TObject);
    procedure cds_BedroommsgAfterInsert(DataSet: TDataSet);
    procedure cds_BedroommsgAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dgh_BedroommsgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cds_BedroommsgeffectiveGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cds_BedroommsgtypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cds_BedroommsggradeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cds_BedmsgeffectiveGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cds_BedroommsgtypeSetText(Sender: TField;
      const Text: String);
    procedure cds_BedroommsggradeSetText(Sender: TField;
      const Text: String);
    procedure cds_DormitorymsgReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_BedroommsgReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_BedmsgReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_BedroommsgeffectiveSetText(Sender: TField;
      const Text: String);
    procedure dsp_BedroommsgAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dsp_BedmsgAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dsp_DormitorymsgAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dgh_BedroommsgKeyPress(Sender: TObject; var Key: Char);
    procedure dgh_BedmsgKeyPress(Sender: TObject; var Key: Char);
    procedure dgh_DormitorymsgKeyPress(Sender: TObject; var Key: Char);
    procedure dgh_DormitorymsgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgh_BedmsgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgh_BedroommsgDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure dgh_BedroommsgGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dgh_BedmsgGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dgh_DormitorymsgGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dgh_BedmsgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dgh_DormitorymsgDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure cds_BedmsgAfterInsert(DataSet: TDataSet);
    procedure cds_BedroommsgemployeecodeChange(Sender: TField);
    procedure cds_BedmsgemployeecodeChange(Sender: TField);
    procedure dsp_DormitorymsgGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure cds_DormitorymsgBeforeCancel(DataSet: TDataSet);
    procedure cds_DormitorymsgAfterCancel(DataSet: TDataSet);
    procedure cds_BedroommsgAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgh_BedroommsgDblClick(Sender: TObject);
    procedure dgh_BedmsgDblClick(Sender: TObject);
    procedure cds_BedmsgeffectiveSetText(Sender: TField;
      const Text: String);
    procedure N1_SeeClick(Sender: TObject);
    procedure N1_AppendClick(Sender: TObject);
    procedure N1_EditClick(Sender: TObject);
    procedure PopupMenu_DormitorymsgPopup(Sender: TObject);
    procedure dgh_DormitorymsgDblClick(Sender: TObject);
    procedure N2_SeeClick(Sender: TObject);
    procedure N2_AppendClick(Sender: TObject);
    procedure N2_EditClick(Sender: TObject);
    procedure N3_SeeClick(Sender: TObject);
    procedure N3_AppendClick(Sender: TObject);
    procedure N3_EditClick(Sender: TObject);
    procedure N1_DeleteClick(Sender: TObject);
    procedure N2_deleteClick(Sender: TObject);
    procedure N3_DeleteClick(Sender: TObject);
    procedure PopupMenu_BedroommsgPopup(Sender: TObject);
    procedure PopupMenu_BedmsgPopup(Sender: TObject);
    procedure cds_BedmsgAfterScroll(DataSet: TDataSet);
    procedure ds_DormitorymsgStateChange(Sender: TObject);
    procedure ds_BedmsgStateChange(Sender: TObject);
    procedure ds_BedroommsgStateChange(Sender: TObject);
    procedure cds_BedroommsgAfterOpen(DataSet: TDataSet);
  private
    DropDown_Info:array of TDropDownInfo;

    procedure CreateNode1(ParentNode: TTreeNode);
   // procedure CreateNode2(ParentNode: TTreeNode);
    procedure DghReadOnlyFocus(Sender :TDBGridEh);
    procedure ColNotReadOnlyFocus(F:TForm;Ds:TDataSet);
    procedure KeyPressDBGridEH(Sender: TDBGridEh; var Key: Char;F:TForm) ;

    
    { Private declarations }
  public
    Cancel_Dormitorymsg,Cancel_Bedroommsg,Cancel_Bedmsg :Boolean;
    procedure CreateTree();
    procedure MultiDataSetClose(ds:array of TCustomClientDataSet;CloseForm:TForm);
    function  SaveCheck_Dormitorymsg():Boolean;
    function  Save_Dormitorymsg():Boolean;
    function  SaveCheck_Bedroommsg():Boolean;
    function  Save_Bedroommsg():Boolean;
    function  SaveCheck_Bedmsg():Boolean;
    function  Save_Bedmsg():Boolean;
    Function PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
    procedure DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);  //
    procedure EF(FormName:Tform);
    procedure ET(FormName:TForm;NotEditComponents:array of string);
    { Public declarations }
  end;

var
  Form1: TForm1;
  Tree_Selectfloor:Integer;

implementation

uses U_DM, common,SelectItemUnit, Unit2, Unit3, Unit4;

{$R *.dfm}  //cds_Bedroommsg

procedure TForm1.ET(FormName:TForm;NotEditComponents:array of string);  //调用：ET(self);或：ET（MYFORMNAME）
  var i,j:integer;
begin   //设窗口上的所有Edit和Combobox类控件可用。

  for i:=formname.ComponentCount-1 downto 0  do
  begin
    if (FormName.Components[i] is TCustomEdit) then
     TEdit(FormName.Components[i]).ReadOnly:=False
    else
    if (FormName.Components[i] is TDBMemo) then
      TDBMemo(FormName.Components[i]).ReadOnly:=False
    else
    if (FormName.Components[i] is TDBComboBox) then
      TDBComboBox(FormName.Components[i]).ReadOnly:=False
    else
    if (FormName.Components[i] is TDBCheckBox) then
      TDBCheckBox(FormName.Components[i]).ReadOnly:=False
    else
    if (FormName.Components[i] is TDBDateTimeEditEh) then
      TDBDateTimeEditEh(FormName.Components[i]).ReadOnly:=False;

    for j:=0 to High (NotEditComponents) do
    if  UpperCase(NotEditComponents[j])=UpperCase(FormName.Components[i].Name ) then
    begin
      if (FormName.Components[i] is TCustomEdit) then
       TEdit(FormName.Components[i]).ReadOnly:=True
      else
      if (FormName.Components[i] is TDBMemo) then
        TDBMemo(FormName.Components[i]).ReadOnly:=True
      else
      if (FormName.Components[i] is TDBComboBox) then
        TDBComboBox(FormName.Components[i]).ReadOnly:=True
      else
      if (FormName.Components[i] is TDBCheckBox) then
        TDBCheckBox(FormName.Components[i]).ReadOnly:=True
      else
      if (FormName.Components[i] is TDBDateTimeEditEh) then
        TDBDateTimeEditEh(FormName.Components[i]).ReadOnly:=True;
    end
  end;
end;

procedure TForm1.EF(FormName:TForm);  //调用：ET(self);或：ET（MYFORMNAME）
  var i:integer;
begin        //设窗口上的所有Edit和Combobox类控件不可用。
  for i:=0 to  formname.ComponentCount-1 do
  begin
    if (FormName.Components[i] is TDBEdit) then
      begin
      (FormName.Components[i]as TDBEdit).ReadOnly:=True;
     // ShowMessage(TDBEdit(FormName.Components[i]).Name)
      end
    else
    if (FormName.Components[i] is TDBMemo) then
      TDBMemo(FormName.Components[i]).ReadOnly:=True
    else
    if (FormName.Components[i] is TDBCheckBox) then
      TDBCheckBox(FormName.Components[i]).ReadOnly:=True
    else
    if (FormName.Components[i] is TDBComboBox) then
      TDBComboBox(FormName.Components[i]).ReadOnly:=True
    else
    if (FormName.Components[i] is TDBDateTimeEditEh) then
      TDBDateTimeEditEh(FormName.Components[i]).ReadOnly:=True;
  end;
end;

procedure TForm1.MultiDataSetClose(ds:array of TCustomClientDataSet;CloseForm:TForm);
var
  s,i,j:integer;
begin
  for i:=0 to High(ds) do
  begin
    with ds[i] do
    begin
      if Active then
      if (ChangeCount>0)or (State in [dsInsert,dsEdit])then
      begin
        s:=messagebox(CloseForm.Handle,'数据还没有保存，你要保存吗？','提示',MB_yesnocancel+MB_iconquestion)  ;
        if s=idyes then
          begin
            for j:=0 to  High(ds) do
            begin
              Save_Dormitorymsg;
              Save_Bedroommsg;
              Save_Bedmsg;
            end;
          end
        else
        if s=idCancel then
        begin
          Abort;
        end
        else
        if s=idNo then
        begin
          Break;
        end;
      end;
    end;
  end
end;

Function TForm1.PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
begin
  try
    Result:=False;
    AQ.Close;
    AQ.SQL.Clear;
    AQ.SQL.Add(sql);
    AQ.Open; //功能：通过执行SQL语句（可以是多表复杂查找），查找相关表中是否存在相关记录，即存在查找。如果找到返回真值，否则返回假值。
//用法：if PrimKeyExists('select * from GongYingShang where 供应商编号='+ quotedstr(trim(ADODateSet1.FieldByName('供应商编号').AsString )))=false then showmessage('不存在');
    if AQ.IsEmpty=False then
    Result:=true ;
  finally

  end;
end;

function  TForm1.SaveCheck_Bedmsg():Boolean;
var
  strMsg:string;
begin
  Result:=True;

  with cds_Bedmsg do
  if IsEmpty=False then
  begin
    if state in [dsEdit,dsInsert]then
    Post;

    if (FieldByName('B_code').IsNull)and( FieldByName('B_code').AsString='' ) then
      strMsg:=strMsg+'字段：“'+FieldByName('B_code').DisplayLabel+'”的值不能为空！！！'+#13;
    if (UpdateStatus=usInserted)and(FieldByName('B_code').AsString<>'') then
    if PrimKeyExists(DM.qry_temp,'  select * from dbo.Bedmsg where bedroomid='
          +cds_Bedroommsgrkey.AsString +' and B_code='+QuotedStr(FieldByName('B_code').asString))  then
      strMsg:=strMsg+'字段：“'+FieldByName('B_code').DisplayLabel+'”的值已经存在！！！'+#13;

    if (UpdateStatus=usModified)and(FieldByName('B_code').AsString<>'') then
    if  UpperCase(Trim(FieldByName('B_code').NewValue))<>UpperCase(Trim(FieldByName('B_code').OldValue)) then//已更新
    if PrimKeyExists(DM.qry_temp,'  select * from dbo.Bedmsg where bedroomid='
             +cds_Bedroommsgrkey.AsString +' and B_code='+QuotedStr(FieldByName('B_code').NewValue))  then
      strMsg:=strMsg+'字段：“'+FieldByName('B_code').DisplayLabel+'”的值已经存在！！！'+#13;
  end;
  if strMsg<>'' then
  begin
    ShowMessage(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

function  TForm1.Save_Bedmsg():Boolean;
begin
  Result:=False;
  if  (cds_Bedmsg.State=dsInsert) or (cds_Bedmsg.UpdateStatus=usInserted)then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      if   SaveCheck_Bedmsg then
      if cds_Bedmsg.ApplyUpdates(0)=0 then
      begin
        Result:=True;
      end;
      with Form1.cds_Bedroommsg   do
      begin
        if FieldByName('bedcount').Value<>Form1.cds_Bedmsg.RecordCount then
        begin
          Edit;
          FieldByName('bedcount').Value:=Form1.cds_Bedmsg.RecordCount;
          Post;
          ApplyUpdates(0);
        end;
      end;
      DM.ADOConnection1.CommitTrans;
    except
      DM.ADOConnection1.RollbackTrans;
    end;
  end
  else
  begin
    if   SaveCheck_Bedmsg then
    if cds_Bedmsg.ApplyUpdates(0)=0 then
    begin
      Result:=True;
    end;
  end;
end;

function  TForm1.SaveCheck_Bedroommsg():Boolean;
var
  strMsg:string;
begin
  Result:=True;

  with cds_Bedroommsg do
  if IsEmpty=False then
  begin
    if state in [dsEdit,dsInsert]then
    Post;
    if (FieldByName('dormitoryid').IsNull) then
      strMsg:=strMsg+'字段：“'+FieldByName('D_name').DisplayLabel+'”的值不能为空！！！'+#13;
    if (FieldByName('R_code').IsNull)or( FieldByName('R_code').AsString='' ) then
      strMsg:=strMsg+'字段：“'+FieldByName('R_code').DisplayLabel+'”的值不能为空！！！'+#13;
    if (FieldByName('R_name').IsNull)or( FieldByName('R_name').AsString='' ) then
      strMsg:=strMsg+'字段：“'+FieldByName('R_name').DisplayLabel+'”的值不能为空！！！'+#13;
    if (FieldByName('bedcount').IsNull)or(FieldByName('bedcount').AsInteger<=0) then   
      strMsg:=strMsg+'字段：“'+FieldByName('bedcount').DisplayLabel+'”的值不能为空！！！'+#13;
    if (FieldByName('floor').IsNull) then
      strMsg:=strMsg+'字段：“'+FieldByName('floor').DisplayLabel+'”的值不能为空！！！'+#13;
    if (FieldByName('type').IsNull) then
      strMsg:=strMsg+'字段：“'+FieldByName('type').DisplayLabel+'”的值不能为空！！！'+#13;
    if (FieldByName('grade').IsNull) then
      strMsg:=strMsg+'字段：“'+FieldByName('grade').DisplayLabel+'”的值不能为空！！！'+#13;
      
    if (UpdateStatus=usInserted) and(FieldByName('R_code').AsString<>'')then
    if PrimKeyExists(DM.qry_temp,'select * from dbo.Bedroommsg where dormitoryid='
             +cds_Dormitorymsgrkey.asString+' and R_code='+QuotedStr(FieldByName('R_code').asString))  then
      strMsg:=strMsg+'字段：“'+FieldByName('R_code').DisplayLabel+'”的值已经存在！！！'+#13;
    if (UpdateStatus=usModified) and(FieldByName('R_code').AsString<>'') then
    if  UpperCase(Trim(FieldByName('R_code').NewValue))<>UpperCase(Trim(FieldByName('R_code').OldValue)) then//已更新
    if PrimKeyExists(DM.qry_temp,'select * from dbo.Bedroommsg where dormitoryid='
             +cds_Dormitorymsgrkey.asString+' and R_code='+QuotedStr(FieldByName('R_code').NewValue))  then
      strMsg:=strMsg+'字段：“'+FieldByName('R_code').DisplayLabel+'”的值已经存在！！！'+#13;

    if (UpdateStatus=usInserted) and(FieldByName('R_name').AsString<>'') then
    if PrimKeyExists(DM.qry_temp,'select * from dbo.Bedroommsg where dormitoryid='
             +cds_Dormitorymsgrkey.asString+' and R_name='+QuotedStr(FieldByName('R_name').Value))  then
      strMsg:=strMsg+'字段：“'+FieldByName('R_name').DisplayLabel+'”的值已经存在！！！'+#13;
    if (UpdateStatus=usModified) and(FieldByName('R_name').OldValue<>'')and(VarIsNull(FieldByName('R_name').OldValue)=False) then
    if  UpperCase(Trim(FieldByName('R_name').NewValue))<>UpperCase(Trim(FieldByName('R_name').OldValue)) then//已更新
    if PrimKeyExists(DM.qry_temp,'select * from dbo.Bedroommsg where dormitoryid='
             +cds_Dormitorymsgrkey.asString+' and R_name='+QuotedStr(FieldByName('R_name').NewValue))  then
      strMsg:=strMsg+'字段：“'+FieldByName('R_name').DisplayLabel+'”的值已经存在！！！'+#13;
  end;

  if strMsg<>'' then
  begin
    ShowMessage(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

function  TForm1.Save_Bedroommsg():Boolean;
begin
  Result:=False;
  if   SaveCheck_Bedroommsg then
//  if cds_Bedroommsg.changeCount>0 then
  if cds_Bedroommsg.ApplyUpdates(0)=0 then
  begin
//    ds_BedroommsgStateChange(nil);
    Result:=True;
  end;
end;

function  TForm1.SaveCheck_Dormitorymsg():Boolean;
var
  strMsg:string;
begin
  Result:=True;
  with cds_Dormitorymsg do
  if IsEmpty=False then
  begin
    if state in [dsEdit,dsInsert]then
    Post;
    if (FieldByName('D_code').IsNull)and( FieldByName('D_code').AsString='' ) then
      strMsg:=strMsg+'字段：“'+FieldByName('D_code').DisplayLabel+'”的值不能为空！！！'+#13 ;
    if (FieldByName('D_name').IsNull)and( FieldByName('D_name').AsString='' ) then
      strMsg:=strMsg+'字段：“'+FieldByName('D_name').DisplayLabel+'”的值不能为空！！！'+#13 ;
    if (FieldByName('D_floor').IsNull)and( FieldByName('D_floor').AsString='' ) then
      strMsg:=strMsg+'字段：“'+FieldByName('D_floor').DisplayLabel+'”的值不能为空！！！'+#13 ;

    if (UpdateStatus=usInserted)and( FieldByName('D_code').AsString<>'' )and( FieldByName('D_name').AsString<>'' ) then
    begin
      if PrimKeyExists(DM.qry_temp,'select * from dbo.Dormitorymsg where D_code='
             +QuotedStr(cds_DormitorymsgD_code.asString))  then
      strMsg:=strMsg+'字段：“'+FieldByName('D_code').DisplayLabel+'”的值已经存在！！！'+#13;

      if PrimKeyExists(DM.qry_temp,'select * from dbo.Dormitorymsg where D_name='
             +QuotedStr(cds_DormitorymsgD_name.asString))  then
      strMsg:=strMsg+'字段：“'+FieldByName('D_name').DisplayLabel+'”的值已经存在！！！'+#13;
    end
    else
    if (UpdateStatus=usModified )and( FieldByName('D_code').AsString<>'' )and( FieldByName('D_name').AsString<>'' )then
    begin
      if  UpperCase(Trim(FieldByName('D_code').NewValue))<>UpperCase(Trim(FieldByName('D_code').OldValue)) then//已更新
      if PrimKeyExists(DM.qry_temp,'select * from dbo.Dormitorymsg where D_code='
             +QuotedStr(cds_DormitorymsgD_code.NewValue))  then
      strMsg:=strMsg+'字段：“'+FieldByName('D_code').DisplayLabel+'”的值已经存在！！！'+#13;

      if  UpperCase(Trim(FieldByName('D_name').NewValue))<>UpperCase(Trim(FieldByName('D_name').OldValue)) then//已更新
      if PrimKeyExists(DM.qry_temp,'select * from dbo.Dormitorymsg where D_name='
             +QuotedStr(cds_DormitorymsgD_name.NewValue))  then
      strMsg:=strMsg+'字段：“'+FieldByName('D_name').DisplayLabel+'”的值已经存在！！！'+#13;
    end;
  end;

  if strMsg<>'' then
  begin
    ShowMessage(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

function  TForm1.Save_Dormitorymsg():Boolean;
begin
  Result:=False;
  if   SaveCheck_Dormitorymsg then
  //if cds_Dormitorymsg.changeCount>0 then
  if cds_Dormitorymsg.ApplyUpdates(0)=0 then
  begin
   // ds_DormitorymsgStateChange(nil);
    Result:=True;
  end;
end;

procedure TForm1.KeyPressDBGridEH(Sender: TDBGridEH; var Key: Char;F:TForm);
var
  i:integer;
begin
  if Key = #13 then
  if f.ActiveControl = Sender then
  begin
    if TDBGridEH(f.ActiveControl).SelectedIndex= TDBGridEH(f.ActiveControl).FieldCount-1 then  //如果选择是最后一行。
    begin
      DghReadOnlyFocus(Sender as TDBGridEh);
      //TDBGridEH(f.ActiveControl).SelectedIndex:=0 ;      //光标就跳回第一列。
      Key := #0;
    end
    else
    begin
      for i:=TDBGridEH(f.ActiveControl).SelectedIndex+1 to TDBGridEH(f.ActiveControl).FieldCount-1 do //
      begin
        if (TDBGridEH(f.ActiveControl).Columns[i].ReadOnly=false) and (TDBGridEH(f.ActiveControl).Columns[i].Visible=true) then
          begin
            TDBGridEH(f.ActiveControl).SelectedIndex :=i; //TDBGridEH(f.ActiveControl).SelectedIndex+1
            Key := #0;
            exit;
          end
        else
        if I=TDBGridEH(f.ActiveControl).FieldCount-1  then
          begin
            DghReadOnlyFocus(Sender as TDBGridEh);
             //TDBGridEH(f.ActiveControl).SelectedIndex:=0 ;      //光标就跳回第一列。
            Key := #0;
          end;
      end;
    end;
  end;
end;

procedure TForm1.ColNotReadOnlyFocus(F:TForm;Ds:TDataSet);
var
  i:Integer;
begin
  for i:=0 to F.ComponentCount-1 do
  begin
    if (F.Components[i] is TDBGridEh) then
    if (F.Components[i] as TDBGridEh).DataSource.DataSet=Ds then
    begin
      DghReadOnlyFocus(F.Components[i] as TDBGridEh);
      Exit;
    end;
  end;
end;

procedure TForm1.DghReadOnlyFocus(Sender :TDBGridEh);
var
  i:Integer;
begin
  for i:=0 to   (Sender as TDBGridEh).FieldCount-1   do
  begin
    if ((Sender as TDBGridEh).Columns[i].ReadOnly=false)and ((Sender as TDBGridEh).Columns[i].Visible=True ) then   //如果该字段的只读为假
    begin
      (Sender as TDBGridEh).SelectedIndex:=i;            //该字段获得焦点。
      Exit;
    end;
  end;
end;

procedure TForm1.CreateTree();
var
  BootNode:TTreeNode; //根结点
  NodeInfo: ^Integer; //rkey
  vprev:string;
begin
  vprev:='1';
  TreeView1.Items.Clear;
  with cds_Copy do
  begin
    try
      cds_Copy.CloneCursor(cds_Dormitorymsg,True);
      Screen.Cursor := crHourGlass;
      TreeView1.Items.Clear;
      First;
      while not Eof do
      begin
        New(NodeInfo);
        NodeInfo^:= FieldByName('rkey').AsInteger;
        BootNode:=TreeView1.Items.AddChildObject(nil,
                     Trim(FieldByName('D_name').AsString)+FieldByName('tc').AsString,NodeInfo); //添加根结点，并关联根结点信息
        CreateNode1(BootNode); //创建子树,cds_Dormitorymsg
        Next;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  //tv_display.FullExpand; //展开所有树结点
  //tv_display.AutoExpand:=true;
  TreeView1.ReadOnly:=true;
  //如果是1或3的权限，那么不允许用户拖动
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then TreeView1.DragMode:=dmManual else TreeView1.DragMode:=dmAutomatic;
end;

procedure TForm1.CreateNode1(ParentNode: TTreeNode);
var
  ChildNode:TTreeNode; //孩子结点
  NodeInfo:^Integer; //rkey
begin
  with cds_Bedroommsg_count do
  begin
    if Active=False then
    Open;
    Filtered:=False;
    Filter:= 'dormitoryid='+IntToStr(Integer(ParentNode.Data^)); //Dormitorymsg.FieldByName('rkey').AsString; //
    Filtered:=true;
    First;
    while not Eof do
    begin
      New(NodeInfo);

      NodeInfo^:= FieldByName('dormitoryid').AsInteger;
      ChildNode:=TreeView1.Items.AddChildObject(ParentNode,'第'+FieldByName('floor').AsString+'层'+FieldByName('tc').AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
      childnode.ImageIndex:=0;
     // CreateNode2(ChildNode); //递归
      Next;
    end;
  end;
end;

{procedure TForm1.CreateNode2(ParentNode: TTreeNode);
var
  ChildNode:TTreeNode; //孩子结点
  NodeInfo:^Integer; //rkey
  QueryTmp:TADOQuery;
begin
//  QueryTmp:=TADOQuery.Create(Self);
//  QueryTmp.Clone(Query);
  with cds_Bedroommsg do
  begin
      if Active=False then
      Open;
      Filtered:=False;
  //    sort := 'departmentcode';
      Filter:= 'dormitoryid='+cds_Bedroommsg_count.fieldByName('dormitoryid').AsString
               +' and floor='+cds_Bedroommsg_count.fieldByName('floor').AsString;
               //+IntToStr(Integer(ParentNode.Data^)); //Dormitorymsg.FieldByName('rkey').AsString; //
      //ShowMessage(Filter);
      Filtered:=true;
      First;
      while not Eof do
      begin
        New(NodeInfo);

        NodeInfo^:= FieldByName('rkey').AsInteger;
        ChildNode:=TreeView1.Items.AddChildObject(ParentNode,
               FieldByName('R_name').AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
        childnode.ImageIndex:=0;
        //CreateNode(ChildNode,Query); //递归
        Next;
      end;
     // childnode.ImageIndex:=0;
//      Free; //释放无用的query
  end;
end; }

procedure TForm1.DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);  //
var
  i:Integer;
  L,T,W,X,H:Integer;
  Vpoint:   Tpoint;
begin
  with ((Sender as TControl).Parent).Parent as TDBGridEh do
  begin
    if  DataSource.DataSet is TClientDataSet then
    if ((((Sender as TControl).Parent).Parent as TDBGridEh).DataSource.DataSet as TClientDataSet).ReadOnly then
    Exit;
    if  DataSource.DataSet is TCustomADODataSet then
    if (DataSource.DataSet as TCustomADODataSet).LockType=ltReadOnly then
    Exit;
    if ReadOnly then        //如果当前表格控件是只读，退出。
    Exit;
//    if SelectedField.ReadOnly then    //如果当前表格选择的字段是只读
//    Exit;
  end;

  with ((Sender as TControl).Parent).Parent as TDBGridEh do  //Button的父是EDIT，EDIT的父才是DBGRIDEH控件
  begin
    try
      begin
        for i:=0 to High( DropDown_Info) do
        begin
          if Name= DropDown_Info[i].L_GridName.Name then  //当前正在下拉表格的名子= 遍历DropDown_Info中的表格名
          if UpperCase(DropDown_Info[i].L_DropdownColumn)=UpperCase(SelectedField.FieldName)  then
          with DropDown_Info[i] do
          begin
             Vpoint   := (Sender as TControl).Parent.ClientToScreen(Point((Sender as TControl).Left,(Sender as TControl).Top));
             t:= Vpoint.y+(Sender as TControl).Height;
             if L_FormWidth  =0 then
               w:=500
             else
               w:=L_FormWidth;
             if L_FormHeight  =0 then
               H:=240
             else
               H:=L_FormHeight;
             x:=Screen.Width- Vpoint.X-w- (Sender as TControl).Parent.Width;
             if x<0 then
               L:=Screen.Width -w- (Sender as TControl).Parent.Width
             else
               L:= Vpoint.X- (Sender as TControl).Parent.Width;
               //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
             if  (Screen.Height-t)<   h then t:=Screen.Height-h;

            if L_ListDataSetName.Active=False then
            L_ListDataSetName.Open;                  //
            //DataSource.DataSet.FieldByName(L_DropdownColumn).OnChange(DataSource.DataSet.FieldByName(L_DropdownColumn))
            //ShowMessage(IntToStr(w));
            if L_FormType<=1 then
            begin
              if ShowAddListForm(Self.Handle,L_ListDataSetName,L_ListDataSetFilterField,
                        Trim(L_GridName.FieldColumns[L_DropdownColumn].Field.asstring),
                        L,T,w) then   //
              begin
                if not (L_GridName.DataSource.DataSet.State in [dsEdit,dsInsert]) then
                  L_GridName.DataSource.DataSet.Edit;
                L_GridName.DataSource.DataSet.FieldByName(L_GetValueField).Value :=
                              L_ListDataSetName.FieldByName(L_ListResultField).value;
              end  ;
            end;
          end;
        end;
      end;
    finally

    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:Integer ;
begin
   {
  if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
    exit;
  end;
  }   {  }
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  rkey73 := '2522';
  vprev := '2';  

  self.Caption:=application.Title;
  
  if StrToInt(vprev)in[1,3] then
  begin
    cds_Dormitorymsg   .ReadOnly:=True;
    cds_Bedroommsg     .ReadOnly:=True;
    cds_Bedmsg         .ReadOnly:=True;
  end;

  PageControl1.TabIndex:=0 ;
  cds_Dormitorymsg.Open;
  cds_Bedroommsg.Open;
  cds_Bedmsg.Open;

  CreateTree;

 { SetLength(DropDown_Info,1);
  DropDown_Info[0]:=TDropDownInfo.Create();
  with DropDown_Info[0] do
  begin
    L_GridName              :=dgh_Bedroommsg;
    L_ListDataSetName       :=DM.AQ_employeemsg_extra;
    L_DropdownColumn        :='employeecode';   //审批流程代码
    L_ListDataSetFilterField:='employeecode';
    L_ListResultField       :='employeecode';
    L_GetValueField         :='employeecode';
    L_FormWidth             :=600;
  end;
  DropDown_Info[1]:=TDropDownInfo.Create();
  with DropDown_Info[1] do
  begin
    L_GridName              :=dgh_Bedmsg;
    L_ListDataSetName       :=DM.AQ_employeemsg_extra;
    L_DropdownColumn        :='employeecode';   //审批流程代码
    L_ListDataSetFilterField:='employeecode';
    L_ListResultField       :='employeecode';
    L_GetValueField         :='employeecode';
    L_FormWidth             :=600;
  end; 
  for i:=0 to High(DropDown_Info) do
  begin
    with (DropDown_Info[i].L_GridName) do
    begin
      FieldColumns[DropDown_Info[i].L_DropdownColumn].ButtonStyle:=cbsDropDown;
      FieldColumns[DropDown_Info[i].L_DropdownColumn].AlwaysShowEditButton:=true;
      FieldColumns[DropDown_Info[i].L_DropdownColumn].OnEditButtonClick:= DBGridEHColumnsButtonClick;
    end;
  end;  }
end;

procedure TForm1.cds_DormitorymsgAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('effective').Value:=1;
  ColNotReadOnlyFocus(Self,DataSet);
end;

procedure TForm1.cds_DormitorymsgAfterScroll(DataSet: TDataSet);
begin
  with cds_Bedroommsg do
  begin
    Close;
    //Params.ParamByName('vDormitoryid').Value:= IntToStr(cds_DormitorymsgRkey.AsInteger);
    CommandText:='select employeemsg_extra.employeecode,employeemsg_extra.chinesename,Dormitorymsg.D_name,'
       +' Bedroommsg.* from dbo.Bedroommsg join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey '
       +' left join employeemsg_extra on employeemsg_extra.rkey=monitor '
       +' where dormitoryid='+IntToStr(cds_DormitorymsgRkey.AsInteger)+' order by R_name ';
    Open;
  end;
  ds_DormitorymsgStateChange(ds_Dormitorymsg);
//  if Assigned(Form4) then
//  if  (Form4.Showing) then
//  Form4.DataSource1StateChange(Form4.DataSource1) ;

//  if CheckBox1.Checked=False then
//  begin
//    cds_Bedroommsg.Filtered:=False;
//    cds_Bedroommsg.Filter:='dormitoryid='+IntToStr(cds_DormitorymsgRkey.AsInteger);
//   // ShowMessage(cds_Bedroommsg.Filter);
//    cds_Bedroommsg.Filtered:=True;
//  end;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
begin
  if TreeView1.Selected.Level =0 then
  begin
    PageControl1.TabIndex:=0 ;
    cds_Dormitorymsg.Locate('rkey',IntToStr(Integer(TreeView1.Selected.Data^)),[]);
    
//    cds_Dormitorymsg.Filtered:=False       ;
//    cds_Dormitorymsg.Filter:='rkey='+IntToStr(Integer(TreeView1.Selected.Data^)) ;
//    cds_Dormitorymsg.Filtered:=True       ;
  end
  else
  if TreeView1.Selected.Level =1 then
  begin
    cds_Dormitorymsg.Locate('rkey',IntToStr(Integer(TreeView1.Selected.Data^)),[]);
    with cds_Bedroommsg do
    begin
      Tree_Selectfloor:= StrToInt(Copy(widestring(TreeView1.Selected.Text),2,1));
      Close;
    //  Params.ParamByName('vDormitoryid').Value:= IntToStr(cds_DormitorymsgRkey.AsInteger);
      CommandText:='select employeemsg_extra.employeecode,employeemsg_extra.chinesename,Dormitorymsg.D_name,'
         +' Bedroommsg.* from dbo.Bedroommsg join Dormitorymsg on Bedroommsg.dormitoryid=Dormitorymsg.rkey '
         +' left join employeemsg_extra on employeemsg_extra.rkey=monitor '
         +' where dormitoryid='+IntToStr(Integer(TreeView1.Selected.Data^))//IntToStr(cds_DormitorymsgRkey.AsInteger)
         +' and  floor='+IntToStr(Tree_Selectfloor)+' order by R_name ';
      Open;
    end;
    PageControl1.TabIndex:=1 ;
//    cds_Bedroommsg.Filtered:=False       ;
//    cds_Bedroommsg.Filter:='dormitoryid='+IntToStr(Integer(TreeView1.Selected.Data^))
//                                +' and  floor='+Copy(widestring(TreeView1.Selected.Text),2,1);
//   // ShowMessage(cds_Bedroommsg.Filter)  ;
//    cds_Bedroommsg.Filtered:=True       ;
  end
end;

procedure TForm1.cds_BedroommsgAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('dormitoryid').Value:=cds_Dormitorymsgrkey.Value;
  if Tree_Selectfloor>0 then
    DataSet.FieldByName('floor').Value:=Tree_Selectfloor
  else
    DataSet.FieldByName('floor').Value:=1;
  DataSet.FieldByName('D_name').Value:=cds_DormitorymsgD_name.Value;
  DataSet.FieldByName('effective').Value:=1;
  DataSet.FieldByName('bedcount').Value:=1;
  DataSet.FieldByName('remark').Value:='无';
  DataSet.FieldByName('equipment_remark').Value:='无';
  ColNotReadOnlyFocus(Self,DataSet);
end;

procedure TForm1.cds_BedroommsgAfterScroll(DataSet: TDataSet);
begin

  begin
    with cds_Bedmsg do
    begin
      Close;
      Params.ParamByName('vBedroomid').Value:= IntTostr(cds_Bedroommsgrkey.AsInteger);
     { CommandText:='select employeemsg_extra.chinesename /*姓名*/,employeemsg_extra.employeecode , '
         +' employeemsg_extra.factoryarea	 /*工厂区域*/,employeemsg_extra.departmentname /*部门*/, '
         +' employeemsg_extra.position /*职位*/,employeemsg_extra.ondutytime /*入职日期*/,'
         +' employeemsg_extra.Province,employeemsg_extra.birthday,employeemsg_extra.phone,Bedmsg.* '
         +' from Bedmsg left join employeemsg_extra on Bedmsg.employeeid=employeemsg_extra.rkey '
         +' where bedroomid='+IntTostr(cds_Bedroommsgrkey.AsInteger)+' order by B_code';  }
      Open;
    end;
    ds_BedroommsgStateChange (ds_Bedroommsg);
  end


//  if Assigned(Form2) then
//  if (Form2.Showing) then
//  Form2.DataSource1StateChange(Form2.DataSource1) ;

//  if (CheckBox1.Checked=False)and(cds_Bedmsg.Active) then
//  begin
//    cds_Bedmsg.Filtered:=False;
//    cds_Bedmsg.Filter:='bedroomid='+IntTostr(cds_Bedroommsgrkey.AsInteger) ;
//    cds_Bedmsg.Filtered:=True;
//  end

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  cds_Dormitorymsg.First;
  cds_Bedmsg.Open;
end;

procedure TForm1.dgh_BedroommsgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText)
  end;
end;

procedure TForm1.cds_BedroommsgeffectiveGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  Sender.Value=1 then
    Text:='有效'
  else
  if  Sender.Value=0 then
    Text:='无效' ;
end;

procedure TForm1.cds_BedroommsgtypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if  Sender.Value=0 then
    Text:='女'
  else
  if  Sender.Value=1 then
    Text:='男'
  else
  if  Sender.Value=2 then
    Text:='家庭'  ;
end;

procedure TForm1.cds_BedroommsggradeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  Trim(Sender.asString)='A' then
    Text:='职工'
  else
  if  Trim(Sender.asString)='B' then
    Text:='干部';

end;

procedure TForm1.cds_BedmsgeffectiveGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  Sender.Value=1 then
    Text:='有效'
  else
  if  Sender.Value=0 then
    Text:='无效' ;
end;

procedure TForm1.cds_BedroommsgtypeSetText(Sender: TField;
  const Text: String);
begin
  if Trim(Text)='女'  then
    Sender.Value:=0    //' when type=1 then '男' when type=2 then '家庭 男  女
  else
  if Trim(Text)='男'  then
     Sender.Value:=1
  else
  if Trim(Text)='家庭'  then
     Sender.Value:=2 ;
end;

procedure TForm1.cds_BedroommsggradeSetText(Sender: TField;
  const Text: String);
begin
  if Trim(Text)='职工'  then
      Sender.asString:='A'  //   //A职工B干部
  else
  if Trim(Text)='干部'  then
    Sender.asString:='B';
end;

procedure TForm1.cds_DormitorymsgReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure TForm1.cds_BedroommsgReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure TForm1.cds_BedmsgReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure TForm1.cds_BedroommsgeffectiveSetText(Sender: TField;
  const Text: String);
begin
  if Trim(Text)='有效'  then
    Sender.Value:=1
  else
  if  Trim(Text)='无效' then
     Sender.Value:=0;
end;

procedure TForm1.dsp_BedroommsgAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
var
  i:Integer;
  strSQL:string;
begin
  if UpdateKind= ukInsert then      
  begin
    with DM.dtRead  do
    begin
      Close;
      CommandText:='select @@identity';
      Open;
      DeltaDS.FieldByName('rkey').ReadOnly:=False;
      DeltaDS.FieldByName('rkey').NewValue:=DM.dtRead.Fields[0].Value;
      Close;
    end;
    
    for i:=0 to  cds_Bedroommsgbedcount.AsInteger-1 do
    begin
      strSQL:=strSQL+'insert into dbo.Bedmsg(bedroomid,B_code,effective) values('
          +IntToStr(DeltaDS.FieldByName('rkey').NewValue)+','
          +QuotedStr(cds_BedroommsgR_code.value+Copy('0',0,2-Length(IntToStr(i+1)))+IntToStr(i+1))+',1)'+#13;
    end;
    with DM.qry_temp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:=  strSQL;
     // ShowMessage(SQL.Text);
      ExecSQL;
    end;

    with cds_Bedmsg do  //重新打开
    begin
      Close;
      Params.ParamByName('vBedroomid').Value:= IntToStr(DeltaDS.FieldByName('rkey').NewValue);
    {  CommandText:='select employeemsg_extra.chinesename /*姓名*/,employeemsg_extra.employeecode , '
         +' employeemsg_extra.factoryarea	 /*工厂区域*/,employeemsg_extra.departmentname /*部门*/, '
         +' employeemsg_extra.position /*职位*/,employeemsg_extra.ondutytime /*入职日期*/,'
         +' employeemsg_extra.Province,employeemsg_extra.birthday,employeemsg_extra.phone,Bedmsg.* '
         +' from Bedmsg left join employeemsg_extra on Bedmsg.employeeid=employeemsg_extra.rkey '
         +' where bedroomid='+IntTostr(DeltaDS.FieldByName('rkey').NewValue)+' order by B_code';  }
      Open;
    end;
  end;
  
end;

procedure TForm1.dsp_BedmsgAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then     
  begin
     with DM.dtRead  do
     begin
       Close;
       CommandText:='select @@identity';
       Open;
       DeltaDS.FieldByName('rkey').ReadOnly:=False;
       DeltaDS.FieldByName('rkey').NewValue:=DM.dtRead.Fields[0].Value;
       Close;
     end;


  end;
end;

procedure TForm1.dsp_DormitorymsgAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then      
  begin
     with DM.dtRead  do
     begin
       Close;
       CommandText:='select @@identity';
       Open;
       DeltaDS.FieldByName('rkey').ReadOnly:=False;
       DeltaDS.FieldByName('rkey').NewValue:=DM.dtRead.Fields[0].Value;
       Close;
     end;
  end;
end;

procedure TForm1.dgh_BedroommsgKeyPress(Sender: TObject; var Key: Char);
begin
  KeyPressDBGridEH(Sender as TDBGridEh, key,self);
end;

procedure TForm1.dgh_BedmsgKeyPress(Sender: TObject; var Key: Char);
begin
  KeyPressDBGridEH(Sender as TDBGridEh, key,self);
end;

procedure TForm1.dgh_DormitorymsgKeyPress(Sender: TObject; var Key: Char);
begin
  KeyPressDBGridEH(Sender as TDBGridEh, key,self);
end;

procedure TForm1.dgh_DormitorymsgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText)
  end;
end;

procedure TForm1.dgh_BedmsgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText)
  end;
end;

procedure TForm1.dgh_BedroommsgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin                      //   or (State=[gdSelected,gdFocused] )
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
end;

procedure TForm1.dgh_BedroommsgGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TForm1.dgh_BedmsgGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TForm1.dgh_DormitorymsgGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TForm1.dgh_BedmsgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin                      //   or (State=[gdSelected,gdFocused] )
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
end;

procedure TForm1.dgh_DormitorymsgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin                      //   or (State=[gdSelected,gdFocused] )
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
end;

procedure TForm1.cds_BedmsgAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('bedroomid').Value:=cds_Bedroommsgrkey.Value;
  DataSet.FieldByName('R_code').Value:=cds_BedroommsgR_code.Value;
  DataSet.FieldByName('R_name').Value:=cds_BedroommsgR_name.Value;
  DataSet.FieldByName('B_code').Value:=DataSet.FieldByName('R_code').Value;
  DataSet.FieldByName('effective').Value:=1;
  ColNotReadOnlyFocus(Self,DataSet);
end;

procedure TForm1.cds_BedroommsgemployeecodeChange(Sender: TField);
begin
  with DM.AQ_employeemsg_extra do
  if Active=False then
  Open;

  if DM.AQ_employeemsg_extra.Filtered then
  DM.AQ_employeemsg_extra.Filtered:=False;

  with Sender.DataSet do
  if not(State in [dsEdit,dsInsert]) then
  Edit;

  if Sender.IsNull then
  begin
    Sender.DataSet .FieldByName('monitor').Value:=null;
    Sender.DataSet .FieldByName('chinesename').Value:=null;
  end
  else
  begin
    if DM.AQ_employeemsg_extra.Locate('employeecode',Sender.Value,[loCaseInsensitive]) then
      begin
      Sender.DataSet .FieldByName('monitor').Value:=DM.AQ_employeemsg_extra.FieldByName('rkey').Value;
      Sender.DataSet .FieldByName('chinesename').Value:=DM.AQ_employeemsg_extra.FieldByName('chinesename').Value;
      end
    else
      begin
        Sender.DataSet .FieldByName('monitor').Value:=null;
        Sender.DataSet .FieldByName('chinesename').Value:=null;
        if Trim(Sender.Value)<>'' then
        ShowMessage('雇员代码不存在！！！');
        Sender.Value   :=null;
      end;
  end;
end;

procedure TForm1.cds_BedmsgemployeecodeChange(Sender: TField);
begin
  with DM.AQ_employeemsg_extra do
  if Active=False then
  Open;

  if DM.AQ_employeemsg_extra.Filtered then
  DM.AQ_employeemsg_extra.Filtered:=False;

  with Sender.DataSet do
  if not(State in [dsEdit,dsInsert]) then
  Edit;

  if Sender.IsNull then
  begin
    Sender.DataSet .FieldByName('employeeid').Value:=null;
    Sender.DataSet .FieldByName('chinesename').Value:=null;
    Sender.DataSet .FieldByName('factoryarea').Value:=null;
    Sender.DataSet .FieldByName('departmentname').Value:=null;
    Sender.DataSet .FieldByName('position').Value:=null;
    Sender.DataSet .FieldByName('ondutytime').Value:=null;
    Sender.DataSet .FieldByName('Province').Value:=null;
    Sender.DataSet .FieldByName('birthday').Value:=null;
    Sender.DataSet .FieldByName('phone').Value:=null;
  end
  else
  begin
    if DM.AQ_employeemsg_extra.Locate('employeecode',Sender.Value,[loCaseInsensitive]) then
      begin
      Sender.DataSet .FieldByName('employeeid').Value:=DM.AQ_employeemsg_extra.FieldByName('rkey').Value  ;
      Sender.DataSet .FieldByName('chinesename').Value:=DM.AQ_employeemsg_extra.FieldByName('chinesename').Value  ;
      Sender.DataSet .FieldByName('factoryarea').Value:=DM.AQ_employeemsg_extra.FieldByName('factoryarea').Value  ;
      Sender.DataSet .FieldByName('departmentname').Value:=DM.AQ_employeemsg_extra.FieldByName('departmentname').Value  ;
      Sender.DataSet .FieldByName('position').Value:=DM.AQ_employeemsg_extra.FieldByName('position').Value  ;
      Sender.DataSet .FieldByName('ondutytime').Value:=DM.AQ_employeemsg_extra.FieldByName('ondutytime').Value  ;
      Sender.DataSet .FieldByName('Province').Value:=DM.AQ_employeemsg_extra.FieldByName('Province').Value  ;
      Sender.DataSet .FieldByName('birthday').Value:=DM.AQ_employeemsg_extra.FieldByName('birthday').Value  ;
      Sender.DataSet .FieldByName('phone').Value:=DM.AQ_employeemsg_extra.FieldByName('phone').Value  ;
      end
    else
      begin
        Sender.DataSet .FieldByName('employeeid').Value:=null;
        Sender.DataSet .FieldByName('chinesename').Value:=null;
        Sender.DataSet .FieldByName('factoryarea').Value:=null;
        Sender.DataSet .FieldByName('departmentname').Value:=null;
        Sender.DataSet .FieldByName('position').Value:=null;
        Sender.DataSet .FieldByName('ondutytime').Value:=null;
        Sender.DataSet .FieldByName('Province').Value:=null;
        Sender.DataSet .FieldByName('birthday').Value:=null;
        Sender.DataSet .FieldByName('phone').Value:=null;
        if Trim(Sender.Value)<>'' then
        ShowMessage('雇员代码不存在！！！');
      end;
  end;
end;

procedure TForm1.dsp_DormitorymsgGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:='Dormitorymsg';
end;

procedure TForm1.cds_DormitorymsgBeforeCancel(DataSet: TDataSet);
begin
  Cancel_Dormitorymsg:=True;
end;

procedure TForm1.cds_DormitorymsgAfterCancel(DataSet: TDataSet);
begin
  Cancel_Dormitorymsg:=False;
end;

procedure TForm1.cds_BedroommsgAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  cds_Dormitorymsg.Refresh;
  cds_Bedroommsg_count.Refresh;
  CreateTree;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MultiDataSetClose([cds_Dormitorymsg,cds_Bedroommsg,cds_Bedmsg],Self)
end;

procedure TForm1.dgh_BedroommsgDblClick(Sender: TObject);
begin
  N2_SeeClick(nil)  ;
end;

procedure TForm1.dgh_BedmsgDblClick(Sender: TObject);
begin
  N3_SeeClick(nil);
end;

procedure TForm1.cds_BedmsgeffectiveSetText(Sender: TField;
  const Text: String);
begin
  if Trim(Text)='有效'  then
    Sender.Value:=1
  else
  if  Trim(Text)='无效' then
     Sender.Value:=0;
end;

procedure TForm1.N1_SeeClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm4, Form4);
    EF( Form4);
  //  DM.DataSource1StateChange(DM.DataSource1);
    with  form4 do
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btDelete.Enabled:=False;
      ShowModal ;
    end;
  finally
    form4.Free;
  end;


end;

procedure TForm1.N1_AppendClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm4, Form4);
    cds_Dormitorymsg.Append;
    ET( Form4,['DBMemo1']);
    ds_DormitorymsgStateChange(ds_Dormitorymsg);
    form4.ShowModal;
  finally
    form4.Free;
  end;

end;

procedure TForm1.N1_EditClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm4, Form4);
    cds_Dormitorymsg.Edit;
    ET( Form4,['DBMemo1']);
    ds_DormitorymsgStateChange(ds_Dormitorymsg);
   // Form4.DataSource1StateChange(nil);
    form4.ShowModal;
  finally
    form4.Free;
  end;
end;

procedure TForm1.PopupMenu_DormitorymsgPopup(Sender: TObject);
begin
  if StrToInt(vprev)in[2,4] then
  begin
    N1_Append.Enabled:=True;
    N1_Edit  .Enabled:=cds_Dormitorymsg.IsEmpty=False;
    N1_Delete.Enabled:= (cds_Bedroommsg.IsEmpty)and (cds_Dormitorymsg.IsEmpty=False) ;
  end;
end;

procedure TForm1.dgh_DormitorymsgDblClick(Sender: TObject);
begin
  N1_See.Click;
end;

procedure TForm1.N2_SeeClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm2, Form2);
    EF( Form2);
  //  DM.DataSource1StateChange(DM.DataSource1);
    with  Form2 do
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btDelete.Enabled:=False;
      ShowModal ;
    end;
  finally
    Form2.Free;
  end;
end;

procedure TForm1.N2_AppendClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm2, Form2);
    cds_Bedroommsg.Append;
    ET( Form2,['DBEdit_D_name','edt_chinesename']); 
    //form2.DataSource1.OnStateChange(form2.DataSource1) ;
    ds_BedroommsgStateChange(ds_Bedroommsg);
    form2.ShowModal;
  finally
    form2.Free;
  end;
end;

procedure TForm1.N2_EditClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm2, Form2);
    cds_Bedroommsg.Edit;
    ET( Form2,['DBEdit_D_name','edt_chinesename']);  
  //  ds_BedroommsgStateChange(ds_Bedroommsg);
    Form2.ShowModal;
  finally
    Form2.Free;
  end;
end;

procedure TForm1.N3_SeeClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm3, Form3);
    EF( Form3);
  //  DM.DataSource1StateChange(DM.DataSource1);
    with  Form3 do
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btDelete.Enabled:=False;
      ShowModal ;
    end;
  finally
    Form3.Free;
  end;
end;

procedure TForm1.N3_AppendClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm3, Form3);
    cds_Bedmsg.Append;
    ET( Form3,[]);    // 'DBMemo1'
    ds_BedmsgStateChange(ds_Bedmsg);
    Form3.ShowModal;
  finally
    Form3.Free;
  end;
end;

procedure TForm1.N3_EditClick(Sender: TObject);
begin
  try
    Application.CreateForm(TForm3, Form3);
    cds_Bedmsg.Edit;
    ET( Form3,['DBMemo1']);
   // ds_BedmsgStateChange(ds_Bedmsg);
    form3.ShowModal;
  finally
    form3.Free;
  end;
end;

procedure TForm1.N1_DeleteClick(Sender: TObject);
begin
  with cds_Dormitorymsg do
  if Active and IsEmpty=False then
  begin
    Delete;
    if Save_Dormitorymsg then
      CreateTree
    else
      begin
        CancelUpdates;
      end;
   // ds_Dormitorymsg.OnStateChange(nil);
  end
end;

procedure TForm1.N2_deleteClick(Sender: TObject);
begin
  with cds_Bedroommsg do
  if Active and IsEmpty=False then
  begin
    Delete;
    ApplyUpdates(0)    ;
    CreateTree;
   // ds_Dormitorymsg.OnStateChange(nil);
  end
end;

procedure TForm1.N3_DeleteClick(Sender: TObject);
begin
  with cds_Bedmsg do
  if Active and IsEmpty=False then
  begin
    Delete;
    if Save_Bedmsg=False then
    begin
      CancelUpdates;
    end;
   // ds_Dormitorymsg.OnStateChange(nil);
  end
end;

procedure TForm1.PopupMenu_BedroommsgPopup(Sender: TObject);
begin
  if StrToInt(vprev)in[2,4] then
  begin
    N2_Append.Enabled:=True;
    N2_Edit  .Enabled:=cds_Bedroommsg.IsEmpty=False;
    N2_Delete.Enabled:= (cds_Bedmsg.IsEmpty )and(cds_Bedroommsg.IsEmpty=False);
  end;
end;

procedure TForm1.PopupMenu_BedmsgPopup(Sender: TObject);
begin
  if (StrToInt(vprev)in[2,4])and(cds_Bedroommsg.IsEmpty=False)  then
  begin
    N3_Append.Enabled:=True;
    N3_Edit  .Enabled:=cds_Bedmsg.IsEmpty=False;
    with DM.qry_Bedroomusemsg do
    begin
      Close;
      Parameters.ParamByName('vbedid').Value:=cds_Bedroommsgrkey.Value  ;
      Open;
      N3_Delete.Enabled:= IsEmpty and (cds_Bedmsg.IsEmpty=False) ;
      Close;
    end;
  end;
end;

procedure TForm1.cds_BedmsgAfterScroll(DataSet: TDataSet);
begin
  ds_BedmsgStateChange(ds_Bedmsg);
//  if Assigned(Form3) then
//  if (Form3.Showing) then
//  Form3.DataSource1StateChange(Form3.DataSource1) ;
end;

procedure TForm1.ds_DormitorymsgStateChange(Sender: TObject);
begin
  if Assigned(Form4)then
  if (Form4.Showing )then
  with   Form4 do
  with (Sender as TDataSource).DataSet as TClientDataSet do
  if  (State in[dsEdit,dsInsert])or(ChangeCount>0) then
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btPost.Enabled:=(StrToInt(vprev)in [2,4]);
      btCancel.Enabled:=True;
      btDelete.Enabled:=False;
      btRefresh.Enabled:=False;
      btNext.Enabled:=False;
      btPrior.Enabled:=False;
    end
  else
    begin
      btInsert.Enabled:=(StrToInt(vprev)in [2,4]);
      btEdit.Enabled:=(StrToInt(vprev)in [2,4]);
      btPost.Enabled:=False;
      btCancel.Enabled:=False;
      btDelete.Enabled:=(StrToInt(vprev)in [2,4])and(Form1.cds_Bedroommsg.IsEmpty);
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
 //     BitBtn3.Enabled:= False;
    end;
end;

procedure TForm1.ds_BedmsgStateChange(Sender: TObject);
begin
  with DM.qry_Bedroomusemsg do
  begin
    Close;
    Parameters.ParamByName('vbedid').Value:=Form1.cds_Bedroommsgrkey.Value  ;
    Open;
  end;

  if Assigned(Form3)then
  if  (Form3.Showing )then
  begin
    with   Form3 do
    with (Sender as TDataSource).DataSet as TClientDataSet do
    if  (State in[dsEdit,dsInsert])or(ChangeCount>0) then
      begin
        btInsert.Enabled:=False;
        btEdit.Enabled:=False;
        btPost.Enabled:=(StrToInt(vprev)in [2,4]);
        btCancel.Enabled:=True;
        btDelete.Enabled:=False;
        btRefresh.Enabled:=False;
        btNext.Enabled:=False;
        btPrior.Enabled:=False;
      end
    else
      begin
        btInsert.Enabled:=(StrToInt(vprev)in [2,4]);
        btEdit.Enabled:=(StrToInt(vprev)in [2,4]);
        btPost.Enabled:=False;
        btCancel.Enabled:=False;
        btDelete.Enabled:=(StrToInt(vprev)in [2,4])and(DM.qry_Bedroomusemsg.IsEmpty);
        btRefresh.Enabled:=True;
        btNext.Enabled:=True;
        btPrior.Enabled:=True;
      end;
  end;
end;

procedure TForm1.ds_BedroommsgStateChange(Sender: TObject);
begin
  if Assigned(Form2)then
  if (Form2.Showing )then
  begin
    with   Form2 do
    with (Sender as TDataSource).DataSet as TClientDataSet do
    if  (State in[dsEdit,dsInsert])or(ChangeCount>0) then
      begin
        btInsert.Enabled:=False;
        btEdit.Enabled:=False;
        btPost.Enabled:=(StrToInt(vprev)in [2,4]);
        btCancel.Enabled:=True;
        btDelete.Enabled:=False;
        btRefresh.Enabled:=False;
        btNext.Enabled:=False;
        btPrior.Enabled:=False;
      end
    else
      begin
        btInsert.Enabled:=(StrToInt(vprev)in [2,4]);
        btEdit.Enabled:=(StrToInt(vprev)in [2,4]);
        btPost.Enabled:=False;
        btCancel.Enabled:=False;
        btDelete.Enabled:=(StrToInt(vprev)in [2,4])and(Form1.cds_Bedmsg.IsEmpty);
        btRefresh.Enabled:=True;
        btNext.Enabled:=True;
        btPrior.Enabled:=True;
   //     BitBtn3.Enabled:= False;
      end;
  end;
end;

procedure TForm1.cds_BedroommsgAfterOpen(DataSet: TDataSet);
begin
  if  DataSet.IsEmpty then
  begin
    with cds_Bedmsg do
    begin
      Close;
      Params.ParamByName('vBedroomid').Value:= IntTostr(0);
      Open;
    end;
  end;
end;

end.
