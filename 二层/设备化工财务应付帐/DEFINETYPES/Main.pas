unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, Menus, ExtCtrls, Buttons, Grids,
  DBGrids, ADODB, Mask, DBCtrls;

type
  TFrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOData0520: TADOQuery;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    ADOData0520RKEY: TIntegerField;
    ADOData0520TTYPE: TSmallintField;
    ADOData0520NAME: TStringField;
    ADOData0520DESCRIPTION: TStringField;
    ADOData0520GL_ACCT_PTR: TIntegerField;
    ADOData0520CTYPE: TStringField;
    ADOData0520gl_acc_number: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    ADOData0520gl_description: TStringField;
    DBEdit5: TDBEdit;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ADO0520: TADOQuery;
    user_ptr: TLabel;
    db_ptr: TLabel;
    vpass: TLabel;
    vprev: TLabel;
    procedure ADOData0520CalcFields(DataSet: TDataSet);
    procedure N14Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

uses EditItem, AcctSearch;

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

procedure TFrmMain.ADOData0520CalcFields(DataSet: TDataSet);
begin
  if Adodata0520.FieldByName('ttype').asinteger=0
  then Adodata0520.fieldbyname('ctype').asstring:='ÊÕÈë'
  else Adodata0520.fieldbyname('ctype').asstring:='Ö§³ö';
end;

procedure TFrmMain.N14Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.N2Click(Sender: TObject);
begin
  FrmEditItem.edit1.Text:='';
  FrmEditItem.edit2.Text:='';
  FrmEditItem.edit3.Text:='';
  FrmEditItem.RadioGroup1.ItemIndex:=0;
  FrmEditItem.Label11.Caption :='';
  AdoData0520.Append ;
  FrmEditItem.showmodal;
end;

procedure TFrmMain.N3Click(Sender: TObject);
begin
  FrmEditItem.edit1.Text:=AdoData0520.Fieldbyname('gl_acc_number').asstring;
  FrmEditItem.Label11.Caption :=AdoData0520.Fieldbyname('gl_description').asstring;
  if self.ADOData0520GL_ACCT_PTR.Value>0 then
   frmedititem.gcc_ptr.Caption:=self.ADOData0520GL_ACCT_PTR.AsString
  else
   frmedititem.gcc_ptr.Caption:='0';
  FrmEditItem.edit2.Text:=trim(AdoData0520.Fieldbyname('name').asstring);
  FrmEditItem.edit3.Text:=trim(AdoData0520.Fieldbyname('description').asstring);
  FrmEditItem.RadioGroup1.ItemIndex:=AdoData0520.Fieldbyname('ttype').asinteger;
  FrmAcctSearch.ADOQuery1.locate('gl_acc_number',FrmEditItem.edit1.Text,[]);
  FrmEditItem.showmodal;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
  if messagedlg('È·ÈÏÒªÉ¾³ý'+Adodata0520.fieldbyname('name').asstring+'ÏîÄ¿Âð£¿',mtconfirmation,[mbYes,mbNo],0)<>mrYes then
    exit;
  with Ado0520 do
  begin
    close;
    parameters.ParamByName('vptr').Value :=Adodata0520.fieldbyname('rkey').asinteger;
    open;
  end;
  Ado0520.Delete ;
  Ado0520.Close ;
  Adodata0520.Close ;
  Adodata0520.Open ;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  if (vpass.Caption<>'AA') OR
    (trim(vprev.Caption)='') then
    close;
  Adoconnection1.ConnectionString :=db_ptr.Caption ;
  Adoconnection1.Connected :=true;
  ADOdata0520.Open ;
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
  user_ptr.Caption := copy(S,3,pos(' ',s)-2);
  vprev.Caption := copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1);
  db_ptr.Caption := copy(S,pos(',',s)+1,length(s)-pos(',',s));
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  Application.CreateForm(TFrmEditItem, FrmEditItem);
  Application.CreateForm(TFrmAcctSearch, FrmAcctSearch);
end;

end.
