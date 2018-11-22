unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Menus, ExtCtrls,Inifiles;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    Button2: TButton;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label3: TLabel;
    ADODataSet1PROGRAME: TStringField;
    ADODataSet1VerNo: TStringField;
    ADODataSet1DESCRIPTION: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label4: TLabel;
    Label5: TLabel;
    ADODataSet1SEQ_NO: TIntegerField;
    ADODataSet1PREV_TP: TStringField;
    ADODataSet1DSDesigner: TStringField;
    ADODataSet1DSDesigner2: TStringField;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Button4: TButton;
    ComboBox3: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ADODataSet1AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private declarations }
   program_ini:Tinifile;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses common; //,ConstVar;
{$R *.dfm}

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ADODataSet1.Filter := 'PROGRAME like ''%'+trim(edit1.text)+'%'''
 else
  ADODataSet1.filter := '';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  FileName: string;
//  Local_Ver_Info: PFile_Ver_INfo;
  i:integer;
  info: TFileInfo;
begin
if Msg_Dlg_Ask('您确定要将本地文件版本信息更新到数据库吗?','提示',1) then
  try
    ADOConnection1.BeginTrans;

    screen.Cursor:=crHourGlass;
    self.ADODataSet1.Close;
    self.ADODataSet1.Open;
    i:=0;
    while not ADODataSet1.eof do
     begin
      fileName := trim(ADODataSet1PROGRAME.Value);
     if GetVerInfo(GetCurrentDir+'\'+filename,info) then
      if (uppercase(info.FileVersion) <>
          uppercase(ADODataSet1VerNo.Value)) or
         (Info.FileDescription<>ADODataSet1DESCRIPTION.Value) then
       begin
        ADODataSet1.Edit;
        ADODataSet1VerNo.Value := Info.FileVersion;
        ADODataSet1DESCRIPTION.Value:=Info.FileDescription;
        ADODataSet1.Post;
        inc(i);
       end;
     ADODataSet1.next;
    end;
   ADOConnection1.CommitTrans;
   screen.Cursor:=crDefault;
   if i>0 then
    showmessage('更新数据库文件版本成功!共更新:'+inttostr(i))
   else
    showmessage('没有可更新的程序文件!');
   self.ADODataSet1.First;
  except
    ADOConnection1.RollbackTrans;
    screen.Cursor:=crDefault;    
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if self.ADODataSet1.IsEmpty then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
self.ADODataSet1.Close;
application.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
var
  FileName: string;
 // Local_Ver_Info: PFile_Ver_INfo;
  info: TFileInfo;
begin
fileName := trim(ADODataSet1PROGRAME.Value);
//Local_Ver_Info := GetFileVersion(GetCurrentDir+'\'+fileName);

 if GetVerInfo(GetCurrentDir+'\'+filename,info) then
  if (uppercase(info.FileVersion) <>
     uppercase(ADODataSet1VerNo.Value)) or
     (Info.FileDescription<>ADODataSet1DESCRIPTION.Value) then
   begin
    adodataset1.Refresh;
    ADODataSet1.Edit;
    ADODataSet1VerNo.Value := info.FileVersion;
    ADODataSet1DESCRIPTION.Value:=Info.FileDescription;
    ADODataSet1.Post;
    showmsg('更新成功!',1);
   end;
end;

procedure TForm1.ADODataSet1AfterOpen(DataSet: TDataSet);
begin
label4.Caption:=inttostr(self.ADODataSet1.RecordCount);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
self.ADOConnection1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if adoconnection1.Connected then ADOConnection1.Connected:=false;
  adoconnection1.ConnectionString:=
  'Provider=SQLOLEDB.1;Password=J02W02302U02I02;Persist Security Info=True;User ID=VerUpdate;';
 adoconnection1.ConnectionString:=
        adoconnection1.ConnectionString+'Initial Catalog='+
        Edit3.Text+';';
  adoconnection1.ConnectionString:=
  adoconnection1.ConnectionString+'Data Source=' + trim(Edit2.Text);
  adoconnection1.Connected := true;
  self.ADODataSet1.Open;
end;

procedure TForm1.FormActivate(Sender: TObject);

begin
  ComboBox3.Items.Clear;
  program_ini:=Tinifile.Create(extractfilepath(paramstr(0))+'WISDOMPCB.INI');
  program_ini.ReadSection('数据库',combobox3.Items);
  ComboBox3.ItemIndex:=0;
 edit2.Text:=program_ini.ReadString('服务器',combobox3.Text,'');
 edit3.Text:=program_ini.ReadString('数据库',combobox3.Text,'');  
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
 edit2.Text:=program_ini.ReadString('服务器',combobox3.Text,'');
 edit3.Text:=program_ini.ReadString('数据库',combobox3.Text,'');
end;

end.
