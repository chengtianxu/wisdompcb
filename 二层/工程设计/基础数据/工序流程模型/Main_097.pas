{******************************************************************************}
{                                                                              }
{Code Maker: Jacky Zhong                                                       }
{Date: Apr. 07. 2007                                                           }
{Comments:                                                                     }
{功能：1.单表操作，可以定义adodataset连接的表，以及dbgrid显示的字段            }
{      2.查询，根据鼠标点中的字段，可以输入字符查询数据。也可以在查找框输入查询}
{                                                                              }
{******************************************************************************}

unit Main_097;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Menus, ComCtrls,db,
  ADODB;

type

  TfrmMain_097 = class(TForm)
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
    N6: TMenuItem;
    Button1: TButton;
    ADOStoredProc1: TADOStoredProc;
    procedure btnDeleteClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtKeyValueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Tmp_Field,Tmp_Input:string;//Tmp_input输入的查找数值, Tmp_Field: 当前查找字段
    KeyField: string;//主要字段，用于验证操作数据表记录是否重复等
    PreColumn: TColumn; //上次选择的column
    //判断数据表0277记录是否可以被删除或者编辑,true，可编辑，false不可(注意：如果重写方法就用override覆盖，不要inherited)
    function Check_Data_Edit_State(keyValue:string):boolean;
    procedure DoSort;//排序
    procedure NewGridWnd(var Message: TMessage);
    function ExecCopy(rKey:integer;ModName,ModDesc:string;var NewRkey:integer):boolean;
  public
    { Public declarations }
//    FSort: PSort; //存储排序字段记录
    procedure DoDelete;virtual;//删除
  end;

var
  frmMain_097: TfrmMain_097;

implementation
uses constVar,common,MyClass,Edit_Data0505,Dlg_Copy;
{$R *.dfm}

procedure TfrmMain_097.btnDeleteClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else if not adsMaster.IsEmpty then
    DoDelete;
end;

procedure TfrmMain_097.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain_097.DBGrid1TitleClick(Column: TColumn);
begin
//处理排序
  Tmp_Field := Column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
  DoSort;
  label_Key_Field.Caption := '查找：'+ Column.Title.Caption;
end;

procedure TfrmMain_097.DBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmMain_097.btnRefreshClick(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.open;
  FormActivate(Sender);
end;

procedure TfrmMain_097.DoSort;
begin
  adsMaster.Sort := Tmp_Field +' ASC';
end;

procedure TfrmMain_097.FormActivate(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := '共：'+IntToStr(adsMaster.RecordCount)+' 笔记录';
end;

function TfrmMain_097.Check_Data_Edit_State(
  keyValue: string): boolean;
begin
end;
 
procedure TfrmMain_097.DoDelete;
begin
  if Msg_Dlg_Ask('确定删除记录吗？','提示',1) then
  begin
//    if not DeleteRecord(adsMaster,KeyField,adsMaster.fieldByName(KeyField).Value) then
    if not MyDataClass.ExecSql(' delete from data0506 where ttype=1 and source_ptr ='+frmMain_097.adsMaster.fieldByName('rKey').Asstring +//in (select rkey from data0505 where eng_flow_ptr='+ frmMain_097.adsMaster.fieldByName('rKey').Asstring+') '+
                               ' delete from data0505 where eng_flow_ptr='+frmMain_097.adsMaster.fieldByName('rKey').Asstring +
                               ' delete from data0504 where rkey='+adsMaster.fieldByName('rKey').AsString) then
      ShowMsg('删除失败，请检查','提示',1)
    else
    begin
      adsMaster.close;
      adsMaster.Open;
      FormActivate(self);
    end;
  end;
end;

procedure TfrmMain_097.btnNewClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
  begin
    with TfrmEdit_Data0505.Create(Application) do
    try
      InitForm(em_Add,-100);
  //    ShowModal;
    finally
      free;
    end;
    FormActivate(sender);
  end;
end;

procedure TfrmMain_097.btnEditClick(Sender: TObject);
begin
{  if not Check_Data_Edit_State(trim(Is_NUll(adsMaster.fieldByName(KeyField).AsString,''))) then
  begin
    ShowMsg('该记录是系统数值，不能编辑','提示',1);
    exit;
  end;}
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
  begin
    with TfrmEdit_Data0505.Create(Application) do
    try
      InitForm(em_Edit,adsMaster.fieldbyName('rKey').AsInteger);
  //    ShowModal;
    finally
      free;
    end;
    FormActivate(sender);
  end;
end;

procedure TfrmMain_097.PopupMenu1Popup(Sender: TObject);
begin
//  N2.Enabled:= Check_Data_Edit_State(trim(Is_NUll(adsMaster.fieldByName(KeyField).AsString,'')));
//  N4.Enabled:= N2.Enabled;
end;

procedure TfrmMain_097.FormShow(Sender: TObject);
begin
//  ADOConnection1.Connected := true;
  adsMaster.Close;
  adsMaster.open;
  KeyField :='ENG_FLOW_NAME';
  Tmp_Field:= KeyField;
  PreColumn:= DBGrid1.Columns[0];
//给结构变量赋值，记录每个字段排序的方法
  MyDataClass :=TMyDataClass.Create(ADOConnection1);
end;

procedure TfrmMain_097.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

procedure TfrmMain_097.edtKeyValueChange(Sender: TObject);
begin
  if trim(edtKeyValue.text)<>'' then
  begin
    adsMaster.Filter:=Tmp_Field+ ' like '''+trim(edtKeyValue.TEXT)+'*''';
    adsMaster.Filtered := true;
  end
  else
    adsMaster.Filtered:= false;
end;

procedure TfrmMain_097.FormCreate(Sender: TObject);
begin
  if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;

//  vprev:='4';
//  App_Test( ADOConnection1);
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  self.Caption :=Application.Title;
end;

procedure TfrmMain_097.NewGridWnd(var Message: TMessage);
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

procedure TfrmMain_097.N6Click(Sender: TObject);
begin
  with TfrmEdit_Data0505.Create(application)do
  try
    InitForm(em_Browse,adsMaster.fieldByName('rKey').AsInteger);
  finally
    free;
  end;
end;

procedure TfrmMain_097.Button1Click(Sender: TObject);
var
  NewRKey:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0);
    exit;
  end;
  NewRKey:=-1000;
  with TfrmDlg_Copy.Create(Application)do
  try
    if showmodal = mrok then
    begin
      if not ExecCopy(adsMaster.fieldByName('rKey').AsInteger,trim(edtModName.Text),trim(edtModDesc.Text),NewRKey) then
      begin
        ShowMsg('复制失败，请检查！',1);
        exit;
      end;
    end;
  finally
    free;
  end;
  if NewRKey=-1000 then exit;
//  ShowMsg('New rkey:'+IntToStr(NewrKey),1);
  adsMaster.Close;
  adsMaster.open;
  adsMaster.Locate('rKey',NewRKey,[loCaseInsensitive]);
  FormActivate(Sender);
end;

function TfrmMain_097.ExecCopy(rKey:integer;ModName, ModDesc: string;var NewRkey:integer):boolean;
var
  spName:string;
  Params:Array [0..4] of variant;
  Direction: array [0..4] of TParameterDirection;
begin
{  spName := 'Copy_Eng_Flow';

  Params[0] := 0;
  Params[1] := rKey;
  Params[2] := ModName;
  Params[3] :=  ModDesc;
  Params[4] :=  0;

  Direction[0] := pdReturnValue;
  Direction[1] := pdInput;
  Direction[2] := pdInput;
  Direction[3] := pdInput;
  Direction[4] := pdOutput;
  try
    MyDataCLass.ExecProc(spName, Params, Direction);
    newRKey:= VarAsType(Params[4],varInteger);
  finally
    result := VarAsType(Params[0],varInteger)=0;//0更新成功，否则失败
  end;}
  ADOStoredProc1.Parameters.ParamByName('@rkey_Org').Value:=rKey;
  ADOStoredProc1.Parameters.ParamByName('@ModName').Value:=ModName;
  ADOStoredProc1.Parameters.ParamByName('@ModDesc').Value:=ModDesc;
//  ADOStoredProc1.Parameters.ParamByName('@rKey_New').Value:=0;
  try
    ADOStoredProc1.ExecProc;
    result := ADOStoredProc1.Parameters.ParamByName('@RETURN_VALUE').Value=0;
    NewRkey:= ADOStoredProc1.Parameters.ParamByName('@rKey_New').Value;
  except
    result := false;
  end;
end;

end.
