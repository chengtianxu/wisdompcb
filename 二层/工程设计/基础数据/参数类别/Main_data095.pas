{******************************************************************************}
{                                                                              }
{Code Maker: Jacky Zhong                                                       }
{Date: Jun. 17. 2007                                                           }
{Comments:                                                                     }
{功能：1.单表操作，可以定义adodataset连接的表，以及dbgrid显示的字段            }
{      2.查询，根据鼠标点中的字段，可以输入字符查询数据。也可以在查找框输入查询}
{                                                                              }
{******************************************************************************}

unit Main_data095;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Menus, ComCtrls,db,
  ADODB;

type

  TfrmMain_data095 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnNew: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    btnRefresh: TButton;
    Panel2: TPanel;
    label_Key_Field: TLabel;
    edtKeyValue: TEdit;
    ADOConnection1: TADOConnection;
    adsMaster: TADODataSet;
    dsMaster: TDataSource;
    procedure btnDeleteClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtKeyValueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure adsMasterNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    Tmp_Field,Tmp_Input:string;//Tmp_input输入的查找数值, Tmp_Field: 当前查找字段
    KeyField: string;//主要字段，用于验证操作数据表记录是否重复等
    PreColumn: TColumn; //上次选择的column
    //判断数据表0277记录是否可以被删除或者编辑,true，可编辑，false不可(注意：如果重写方法就用override覆盖，不要inherited)
    function Check_Data_Edit_State(keyValue:string):boolean;
    procedure DoSort;//排序
    procedure NewGridWnd(var Message: TMessage);

  public
    { Public declarations }
//    FSort: PSort; //存储排序字段记录
    procedure DoDelete;virtual;//删除
  end;

var
  frmMain_data095: TfrmMain_data095;

implementation
uses constVar,common,edit_data0277,MyClass;
{$R *.dfm}


procedure TfrmMain_data095.btnDeleteClick(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
else
 DoDelete;
end;

procedure TfrmMain_data095.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain_data095.DBGrid1TitleClick(Column: TColumn);
begin
//处理排序
  Tmp_Field := Column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
  DoSort;
  label_Key_Field.Caption := '查找：'+ Column.Title.Caption;
end;

procedure TfrmMain_data095.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key= Chr(vk_Back) then
    Tmp_input:=copy(Tmp_input,1,Length(Tmp_input)-1)
  else
  begin
    if key<>chr(vk_return) then
    Tmp_Input:=Tmp_Input+Key;
    adsMaster.Locate(Tmp_Field,Tmp_input,[loPartialKey]);
  end;
  StatusBar1.Panels[1].Text := Tmp_Input;
end;

procedure TfrmMain_data095.btnRefreshClick(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.open;
  FormActivate(Sender);
end;

procedure TfrmMain_data095.DoSort;
begin
  adsMaster.Sort := Tmp_Field +' ASC';
end;

procedure TfrmMain_data095.FormActivate(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := '共：'+IntToStr(adsMaster.RecordCount)+' 笔记录';
end;

function TfrmMain_Data095.Check_Data_Edit_State(
  keyValue: string): boolean;
begin
  result := not((keyvalue= 'GENUNIT') or
            (keyvalue= 'GENPARAM') or
            (keyvalue= 'BOM') or
            (keyvalue= 'COST') or
            (keyvalue= 'SO'));
end;
 
procedure TfrmMain_data095.DoDelete;
begin
  if not Check_Data_Edit_State(adsMaster.fieldByName(KeyField).AsString) then
  begin
    ShowMsg('该记录是系统数值，不能删除','提示',1);
    exit;
  end;
  if Msg_Dlg_Ask('确定删除记录吗？','提示',1) then
  begin
    if not DeleteRecord(adsMaster,KeyField,adsMaster.fieldByName(KeyField).Value) then
      ShowMsg('删除失败，请检查','提示',1)
    else
      FormActivate(self);
  end;
end;

procedure TfrmMain_data095.btnNewClick(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
else
 begin
  with TfrmEdit_Data0277.Create(Application) do
  try
    Enter(em_Add);
  finally
    free;
  end;
  FormActivate(sender);
 end;
end;

procedure TfrmMain_data095.btnEditClick(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
else
 begin
  if not Check_Data_Edit_State(trim(Is_NUll(adsMaster.fieldByName(KeyField).AsString,''))) then
   ShowMsg('该记录是系统数值，不能编辑','提示',1)
  else
   begin
    with TfrmEdit_Data0277.Create(Application) do
    try
     Enter(em_Edit);
    finally
     free;
    end;
     self.FormActivate(sender);
   end;
 end;
end;

procedure TfrmMain_data095.PopupMenu1Popup(Sender: TObject);
begin
  N2.Enabled:= Check_Data_Edit_State(trim(Is_NUll(adsMaster.fieldByName(KeyField).AsString,'')));
  N4.Enabled:= N2.Enabled;
end;

procedure TfrmMain_data095.DBGrid1DblClick(Sender: TObject);
begin
  with TfrmEdit_Data0277.Create(Application) do
  try
    Enter(em_browse);
  finally
    free;
  end;
end;

procedure TfrmMain_data095.FormShow(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.open;
  KeyField :='CATEGORY_NAME';
  Tmp_Field:= KeyField;
  PreColumn:= DBGrid1.Columns[0];
  MyDataClass :=TMyDataClass.Create(ADOConnection1);
end;

procedure TfrmMain_data095.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

procedure TfrmMain_data095.edtKeyValueChange(Sender: TObject);
begin
  if trim(edtKeyValue.text)<>'' then
  begin
    adsMaster.Filter:=Tmp_Field+ ' like '''+trim(edtKeyValue.TEXT)+'*''';
    adsMaster.Filtered := true;
  end
  else
    adsMaster.Filtered:= false;
end;

procedure TfrmMain_data095.FormCreate(Sender: TObject);
begin
  if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  self.Caption :=Application.Title;
end;

procedure TfrmMain_data095.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;


procedure TfrmMain_data095.adsMasterNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('Category_Type').Value := 3;
end;

end.
