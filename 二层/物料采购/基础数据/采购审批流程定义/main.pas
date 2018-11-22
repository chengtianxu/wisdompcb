unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, DB, ADODB, StdCtrls, Provider, DBClient, DBGridEh,
  ExtCtrls, EditBit,StrUtils;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N_New: TMenuItem;
    N_Edit: TMenuItem;
    N_Delete: TMenuItem;
    MainMenu1: TMainMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    ADOConnection1: TADOConnection;
    AQdistinctPURCHASE_TYPE: TADOQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    dtMain: TADODataSet;
    cdsMain: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    dsMain: TDataSource;
    cdsMainuser_id: TStringField;
    cdsMainUSER_FULL_NAME: TStringField;
    cdsMainuser_ptr: TIntegerField;
    cdsMainupper_limit: TBCDField;
    cdsMainlower_limit: TBCDField;
    cdsMainseq_no: TIntegerField;
    cdsMainABBR_NAME: TStringField;
    cdsMainwarehouse_ptr: TIntegerField;
    cdsMainwarehouse_code: TStringField;
    cdsMainPURCHASE_TYPE: TWideStringField;
    AQTemp: TADOQuery;
    AQ0015: TADOQuery;
    AQ073: TADOQuery;
    AQ073USER_LOGIN_NAME: TStringField;
    AQ073USER_FULL_NAME: TStringField;
    AQ073RKEY: TAutoIncField;
    AQ0015warehouse_code: TStringField;
    AQ0015ABBR_NAME: TStringField;
    AQ0015RKEY: TAutoIncField;
    dsp0015: TDataSetProvider;
    cds0015: TClientDataSet;
    dsp0073: TDataSetProvider;
    cds0073: TClientDataSet;
    cds0015warehouse_code: TStringField;
    cds0015ABBR_NAME: TStringField;
    cds0015RKEY: TAutoIncField;
    cds0073USER_LOGIN_NAME: TStringField;
    cds0073USER_FULL_NAME: TStringField;
    cds0073RKEY: TAutoIncField;
    dtMainuser_id: TStringField;
    dtMainUSER_FULL_NAME: TStringField;
    dtMainuser_ptr: TIntegerField;
    dtMainupper_limit: TBCDField;
    dtMainlower_limit: TBCDField;
    dtMainseq_no: TIntegerField;
    dtMainABBR_NAME: TStringField;
    dtMainwarehouse_ptr: TIntegerField;
    dtMainwarehouse_code: TStringField;
    dtMainPURCHASE_TYPE: TWideStringField;
    Label1: TLabel;
    Edit1: TEdit;
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N_NewClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsMainwarehouse_codeChange(Sender: TField);
    procedure cdsMainuser_idChange(Sender: TField);
    procedure cdsMainReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMainAfterInsert(DataSet: TDataSet);
    procedure dsMainStateChange(Sender: TObject);
    procedure cdsMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsMainAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    FilterFieldName:string;
    { Private declarations }
  public
    
    procedure DataSetAddToCombobox(ADataSet:TDataSet;co:TCustomComboBox;FieldName:string='');
    { Public declarations }
  end;

var
  Form1: TForm1;
  strFil:string;
  
implementation

uses edit_limit,common;

{$R *.dfm}

procedure TForm1.DataSetAddToCombobox(ADataSet:TDataSet;co:TCustomComboBox;FieldName:string='');
begin
  try
    if ADataSet.Active=False then
    ADataSet.Open;
    ADataSet.DisableControls;
    ADataSet.First;
    while not( ADataSet.Eof )   do
    begin
      if FieldName='' then
        co.Items.Add(trim(ADataSet.Fields[0].AsString))
      else
        co.Items.Add(trim(ADataSet.FieldByName(FieldName).AsString));
      ADataSet.Next;
    end;
  finally
    ADataSet.EnableControls;
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if cdsMain.IsEmpty then
  begin
 //   N_New.Enabled:=false;
    N_Edit.Enabled:=false;
  end
  else
  begin
    N_Edit.Enabled:=TRUE and (StrToInt(vprev)in[2,4]);
  end;
  N_New.Enabled:=TRUE and (StrToInt(vprev)in[2,4]);
end;

procedure TForm1.N_NewClick(Sender: TObject);
begin
//  form3:=tform3.Create(application);
  cdsMain.Append;
  form3.ShowModal;

end;

procedure TForm1.N_DeleteClick(Sender: TObject);
begin
  if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
  with Form1.cdsMain do
  begin
    if Active=True then
    begin
      Delete;
      ApplyUpdates(0);
    end;
  end;
end;

procedure TForm1.N_EditClick(Sender: TObject);
begin
//  form3:=tform3.Create(application);
  cdsMain.Edit;
  form3.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin  
{ } if not app_init_2(self.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员!','提示',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
     
      
 { ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  ADOConnection1.Open;
  rkey73 := '2522';
  vprev := '2';  }

  cdsMain.Open;
end;

procedure TForm1.cdsMainwarehouse_codeChange(Sender: TField);
begin
  with cds0015 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    if Sender.IsNull then
    begin
      cdsMain.FieldByName('warehouse_ptr') .Value:=null;
      cdsMain.FieldByName('ABBR_NAME')     .Value:=null;
    end
    else
    if Locate('warehouse_code',Sender.Value,[loCaseInsensitive]) then
    begin
      cdsMain.FieldByName('warehouse_ptr') .Value:=FieldByName('rkey') .Value;
      cdsMain.FieldByName('ABBR_NAME')     .Value:=FieldByName('ABBR_NAME')     .Value;
    end
    else
    begin
      cdsMain.FieldByName('warehouse_ptr') .Value:=null;
      cdsMain.FieldByName('ABBR_NAME')     .Value:=null;
      ShowMessage('工厂代码不存在！！！');
    end;
  end;
end;

procedure TForm1.cdsMainuser_idChange(Sender: TField);
begin
  with cds0073 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    if Sender.IsNull then
    begin
      cdsMain.FieldByName('user_ptr')           .Value:=null;
      cdsMain.FieldByName('USER_FULL_NAME')     .Value:=null;
    end
    else
    if Locate('USER_LOGIN_NAME',Sender.Value,[loCaseInsensitive]) then
    begin
      cdsMain.FieldByName('user_ptr')           .Value:=FieldByName('rkey') .Value;
      cdsMain.FieldByName('USER_FULL_NAME')     .Value:=FieldByName('USER_FULL_NAME')     .Value;
    end
    else
    begin
      cdsMain.FieldByName('user_ptr')           .Value:=null;
      cdsMain.FieldByName('USER_FULL_NAME')     .Value:=null;
      ShowMessage('用户代码不存在！！！');
    end;
  end;
end;

procedure TForm1.cdsMainReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage('保存失败！！！原因是：'+e.Message);
end;

procedure TForm1.cdsMainAfterInsert(DataSet: TDataSet);
begin
  cdsMain.FieldByName('lower_limit').Value:=0;
  cdsMain.FieldByName('seq_no').Value:=1;
end;

procedure TForm1.dsMainStateChange(Sender: TObject);
begin
  if Assigned(Form3) then
  with Form3 do
  begin
    if  (cdsMain.State in[dsEdit,dsInsert])or(cdsMain.ChangeCount>0) then
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btPost.Enabled:=True;
      btCancel.Enabled:=True;
      btRefresh.Enabled:=False;
      btNext.Enabled:=False;
      btPrior.Enabled:=False;
    end
    else
    begin
      btInsert.Enabled:=True;
      btEdit.Enabled:=True;
      btPost.Enabled:=False;
      btCancel.Enabled:=False;
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
    end;
  end;
end;

procedure TForm1.cdsMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Trim(Edit1.Text) <>'' then
  Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(Edit1.Text )) ;
  //(Pos(Edit1.Text, DataSet.FieldByName(FilterFieldName).AsString)>0) ;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Field.DataType in[ftString,ftWideString] then
  begin
    Label1.Caption:=Column.Field.DisplayLabel;
    Label1.Left:=5;
    Edit1.Left:=10+ Label1.Width;
    //  bt1.Left:= Edit1.Left+ Edit1.Width+5;
    if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
    begin
     Edit1.Text:='';
     FilterFieldName:= Column.Field.FieldName;
    end;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  with cdsMain do
  if trim(Edit1.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  DBGridEh1TitleClick(DBGridEh1.Columns[4]);
end;

procedure TForm1.cdsMainAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  AQdistinctPURCHASE_TYPE.Close;
  AQdistinctPURCHASE_TYPE.Open;
  Form3.cbb_PURCHASE_TYPE.Clear;
  DataSetAddToCombobox(AQdistinctPURCHASE_TYPE,Form3.cbb_PURCHASE_TYPE);
end;

end.
