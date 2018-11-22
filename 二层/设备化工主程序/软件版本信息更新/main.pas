unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx,Inifiles, DB, ADODB, ComCtrls;

type
  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox1: TRzComboBox;
    Label2: TLabel;
    ComboBox2: TRzComboBox;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    Button2: TButton;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
   program_ini:Tinifile;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses common,ConstVar;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
var
 filename:string;
begin
  ProgressBar1.Parent := StatusBar1;
  ProgressBar1.Top := 2;
  ProgressBar1.Left := 61;
  ProgressBar1.Align := alClient;

 filename:=Extractfilepath(ParamStr(0))+'pcberp.ini';
 program_ini:=Tinifile.Create(filename);
 program_ini.ReadSection('服务器',combobox1.Items);
 program_ini.ReadSection('数据库',combobox2.Items);

 combobox1.Text:=program_ini.ReadString('默认连接','服务器名','');
 combobox2.ItemIndex:=program_ini.ReadInteger('默认数据','数据库',0);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
if trim(combobox1.Text)='' then
begin
  showmessage('请输入ERP服务器的名称!');
  combobox1.SetFocus;
end
else
 begin
   try
     screen.Cursor := crHourglass;
     if adoconnection1.Connected then ADOConnection1.Connected:=false;

      adoconnection1.ConnectionString:=
      'Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security Info=True;User ID=wzsp;Initial Catalog='+
      program_ini.ReadString('数据库',combobox2.Text,'')+';Data Source=' + trim(combobox1.Text);
      adoconnection1.ConnectionString;
      adoconnection1.Connected := true;
      screen.Cursor := crDefault;
    except
       screen.Cursor := crDefault;
       ShowMsg('连接服务器失败，请检查',1);
       abort;
    end;
    Button1.Enabled:=false;
    Update_App_VerNo_To_DB(GetCurrentDir+'\',ADOConnection1,ProgressBar1);
    StatusBar1.Panels[0].Text:='更新完成';
 end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  close;
end;

end.
