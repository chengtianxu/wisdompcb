unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, DBTables, Mask,
  DBCtrls, Menus, ADODB, ExtCtrls;

type
  TFrmMain = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    delete: TMenuItem;
    ADOConnection1: TADOConnection;
    ADOdata0128: TADODataSet;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    Label7: TLabel;
    Splitter1: TSplitter;
    ADOData0001: TADODataSet;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    user_ptr: TLabel;
    db_ptr: TLabel;
    vpass: TLabel;
    vprev: TLabel;
    ADOData0103: TADODataSet;
    ADOdata0128RKEY: TAutoIncField;
    ADOdata0128BANK_NAME: TStringField;
    ADOdata0128BANK_ANAME: TStringField;
    ADOdata0128BANK_ADDRESS_LINE1: TStringField;
    ADOdata0128BANK_ADDRESS_LINE2: TStringField;
    ADOdata0128BANK_ADDRESS_LINE3: TStringField;
    ADOdata0128BANK_ZIPCODE: TStringField;
    ADOdata0128BANK_PHONE: TStringField;
    ADOdata0128BANK_FX: TStringField;
    ADOdata0128BANK_ACCOUNT_NUMBER: TStringField;
    ADOdata0128BANK_CURRENT_CHECK: TStringField;
    ADOdata0128BANK_CONTACT1: TStringField;
    ADOdata0128BANK_CONTACT2: TStringField;
    ADOdata0128BANK_CONTACT3: TStringField;
    ADOdata0128BANK_CON_PHONE1: TStringField;
    ADOdata0128BANK_CON_PHONE2: TStringField;
    ADOdata0128BANK_CON_PHONE3: TStringField;
    ADOdata0128GL_ACCT_PTR: TIntegerField;
    ADOdata0128CURRENCY_PTR: TIntegerField;
    ADOdata0128BAL_AMOUNT: TFloatField;
    ADOdata0128GL_ACC_NUMBER: TStringField;
    ADOdata0128GL_DESCRIPTION: TStringField;
    ADOdata0128CURR_CODE: TStringField;
    Bar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure addClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    hMapFile: THandle;
    MapFilePointer: Pointer;
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses EditItem;

{$R *.dfm}
procedure TFrmMain.NewGridWnd(var Message: TMessage);
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

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
close;
end;

procedure TFrmMain.editClick(Sender: TObject);
var
 rkey:integer;
begin
  IF Adodata0128.Eof THEN EXIT;
  Application.CreateForm(TFrmEditItem, FrmEditItem);
  if Adodata0128.Fieldbyname('gl_acct_ptr').asinteger>0 then
  begin
    FrmEditItem.edit1.Text := Adodata0128.FieldValues['gl_acc_number'];
    FrmEditItem.label11.Caption := Adodata0128.FieldValues['gl_description'];
  end;
  if Adodata0001.locate('rkey',Adodata0128.FieldValues['currency_ptr'],[]) then
  begin
    FrmEditItem.edit2.Text :=FrmMain.Adodata0001.FieldValues['curr_code'];
    FrmEditItem.label18.Caption :=FrmMain.Adodata0001.Fieldbyname('curr_name').asstring;
  end;
  Adodata0128.Edit;
  if FrmEditItem.showmodal=mrok then
  begin
   rkey:=self.ADOdata0128RKEY.Value;
    Adodata0128.Close;
    Adodata0128.Open ;
    self.ADOdata0128.Locate('rkey',rkey,[]);
  end;
  FrmEditItem.free;
end;

procedure TFrmMain.deleteClick(Sender: TObject);
begin
  IF Adodata0128.Eof THEN EXIT;
  if messagedlg('ÄãÈ·¶¨ÒªÉ¾³ýÕâÌõ¼ÇÂ¼Âð?',mtConfirmation,[mbyes,mbno],0)=mryes then
    Adodata0128.Delete;
end;

procedure TFrmMain.ADOTable1AfterDelete(DataSet: TDataSet);
begin
  messagedlg('Êý¾Ý±»³É¹¦É¾³ý!',mtinformation,[mbok],0);
end;

procedure TFrmMain.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
 var Action: TDataAction);
begin
  messagedlg(e.Message,mtWarning,[mbOk],0);
  Abort;
end;

procedure TFrmMain.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
 var Action: TDataAction);
begin
 messagedlg(E.Message,mtWarning,[mbOk],0);
 Abort;
end;

procedure TFrmMain.addClick(Sender: TObject);
begin
  Adodata0128.append;
  Application.CreateForm(TFrmEditItem, FrmEditItem);
  if FrmEditItem.showmodal=mrok then
  begin
//    Adodata0128.Close;
 //   Adodata0128.Open ;
  end;
  FrmEditItem.free;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
S: string;
begin
  hMapFile := CreateFileMapping ($FFFFFFFF, //ì?êa?ú'?ó3é???±ú
    nil, page_ReadWrite, 0,100, 'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0);
  S := PChar (MapFilePointer);//'ó12?í?ú'??á3??úèY
  vpass.Caption := copy(S,1,2);
  user_ptr.Caption := copy(S,3,pos(' ',s)-3);
  vprev.Caption := copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1);
  db_ptr.Caption := copy(S,pos(',',s)+1,length(s)-pos(',',s));
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;  
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  if (vpass.Caption<>'AA') OR
    (trim(vprev.Caption)='') then
    close;
  Adoconnection1.ConnectionString :=db_ptr.Caption ;
  Adoconnection1.Connected :=true;
  Adodata0128.Open ;
  Adodata0001.open;
end;

procedure TFrmMain.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
 if Key = Chr(vk_Back) then       //Èç¹û°´ÏÂÁËbackspace
   begin
    if length(bar1.SimpleText)>10 then
     bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
    if length(bar1.SimpleText)>10 then
     ADOdata0128.Locate('Bank_Name',copy(bar1.SimpleText,11,length(bar1.SimpleText)-10),searchoption)
    else
     ADOdata0128.First
   end
  else
    if key=chr(vk_return) then    //Èç¹û°´ÏÂÁËenter
      editClick(sender)           //µ÷ÓÃ±à¼­ÃüÁî
    ELSE
     begin
     bar1.SimpleText :=bar1.SimpleText+key;
     ADOdata0128.Locate('Bank_Name',copy(bar1.SimpleText,11,length(bar1.SimpleText)-10),searchoption);
     end;
end;

end.

