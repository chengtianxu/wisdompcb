unit form_Main1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, StdCtrls, DBCtrls, Mask, DB, ADODB,
  ExtCtrls;

type
  Tfrm_Main1 = class(TForm)
    tlb1: TToolBar;
    btInsert: TSpeedButton;
    btEdit: TSpeedButton;
    btPost: TSpeedButton;
    btCancel: TSpeedButton;
    btDelete: TSpeedButton;
    btFilter: TSpeedButton;
    btRefresh: TSpeedButton;
    btOut: TSpeedButton;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btUpload: TSpeedButton;
    btDownload: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btPrint: TSpeedButton;
    btClose: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edt_Item: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    lbdefined1: TLabel;
    lbdefined2: TLabel;
    dbdefined1: TDBEdit;
    dbdefined2: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btInsertClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    function SaveCheck():Boolean;
    Function PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
    { Private declarations }
  public
    procedure EF(FormName:Tform);
    procedure ET(FormName:Tform);
    { Public declarations }
  end;

var
  frm_Main1: Tfrm_Main1;

implementation

uses dmo,common;

{$R *.dfm}
procedure Tfrm_Main1.ET(FormName:TForm);  //调用：ET(self);或：ET（MYFORMNAME）
  var i:integer;
begin   //设窗口上的所有Edit和Combobox类控件可用。
  for i:=formname.ComponentCount-1 downto 0  do
  begin
    if (FormName.Components[i] is TCustomEdit) then
     TEdit(FormName.Components[i]).ReadOnly:=False;
    if (FormName.Components[i] is TDBMemo) then
      TDBMemo(FormName.Components[i]).ReadOnly:=False;
  end;
end;

procedure Tfrm_Main1.EF(FormName:TForm);  //调用：ET(self);或：ET（MYFORMNAME）
  var i:integer;
begin        //设窗口上的所有Edit和Combobox类控件不可用。
  for i:=formname.ComponentCount-1 downto 0  do
  begin
    if (FormName.Components[i] is TDBEdit) then
     TDBEdit(FormName.Components[i]).ReadOnly:=True;

    if (FormName.Components[i] is TDBMemo) then
      TDBMemo(FormName.Components[i]).ReadOnly:=True;
  end;
end;

Function Tfrm_Main1.PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
//var
//  myqu:TADOquery;
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
   // myqu.Free;
  end;
end;

function Tfrm_Main1.SaveCheck():Boolean;
var
  strMsg,strSQL:string;
begin
  Result:=False;
  strMsg:='';
  with  DM.ADODetail do
  begin
    if (edt_Item.Text='' ) then
    strMsg:=strMsg+FieldByName('item').DisplayLabel +'：的值不能为空！！！';

    if (State=dsInsert)and(edt_Item.Text<>'') then
    begin
      strSQL:='select * from dbo.datadetail where item='+QuotedStr(FieldByName('item').AsString);
      //ShowMessage(strSQL)   ;
      if PrimKeyExists(DM.AQTemp,strSQL)   then
      strMsg:=strMsg+FieldByName('item').DisplayLabel+'：'+FieldByName('item').AsString+'，该记录已经存在！！！'+#13;
    end;
  end;

  if strMsg<>'' then
  begin
    strMsg:=Copy(strMsg,0,Length(strMsg)-1);
    ShowMessage(strMsg);
    Result:=True;
  end;
end;

procedure Tfrm_Main1.btInsertClick(Sender: TObject);
begin
  with DM.ADODetail do
  if Active then
  Append;
end;

procedure Tfrm_Main1.btPostClick(Sender: TObject);
begin
  with DM.ADODetail do
  if  State in [dsEdit,dsInsert ]  then
  begin
    if SaveCheck=False then
    Post;
  end;
  DM.DSDetailStateChange(DM.DSDetail);  
end;

procedure Tfrm_Main1.btCancelClick(Sender: TObject);
begin
  with DM.ADODetail do
  if Active=True then
  begin
    Cancel;
  end;  
end;

procedure Tfrm_Main1.btDeleteClick(Sender: TObject);
begin
  with DM.ADODetail do
  if Active and (not IsEmpty) then
  begin
    if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
    Delete;
  end;
end;

procedure Tfrm_Main1.btRefreshClick(Sender: TObject);
begin
  with DM.ADODetail do
  begin
    Close;
    Open;
  end;
//  Refresh;
end;

procedure Tfrm_Main1.btPriorClick(Sender: TObject);
begin
  with DM.ADODetail do
  if Active then
  Prior;
end;

procedure Tfrm_Main1.btNextClick(Sender: TObject);
begin
  with DM.ADODetail do
  if Active then
    Next;
end;

procedure Tfrm_Main1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with DM.ADODetail do
  if Active then
  if  (State in [dsInsert,dsEdit])then
  begin
     S:= messagedlg('数据还没有保存,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0);
     if S = mryes  then
       begin
         if  (State in [dsInsert,dsEdit]) then
         if SaveCheck=False then
           Post
         else
          abort;
       end
     else
     if S = mrcancel then
         abort
     else
     if s=mrNo then
       begin
         Cancel    ;
       end;
  end;
end;

procedure Tfrm_Main1.FormCreate(Sender: TObject);
begin
  if StrToInt(vprev)=4 then
    DBCheckBox1.ReadOnly:=False
  else
    DBCheckBox1.ReadOnly:=True;
end;

end.
