unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids,shellapi, StdCtrls, Buttons, Spin,DateUtils,
  Mask, DBCtrls, DBGrids;

type
  TFrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    ADOData0524: TADOQuery;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    //user_ptr: TLabel;
    //db_ptr: TLabel;
    //vpass: TLabel;
    //vprev: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    DataSource1: TDataSource;
    ADOData0524RKEY: TAutoIncField;
    ADOData0524REPORT_FILE: TStringField;
    ADOData0524fyear: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private

    procedure  dispalyexecname();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses Getfile,common;

{$R *.dfm}

procedure TFrmMain.FormShow(Sender: TObject);
begin
 SpinEdit1.Value := yearof(date);
end;

procedure TFrmMain.StringGrid1DblClick(Sender: TObject);
var
  vfile:pchar;
  client_dir:string;
begin
if stringgrid1.Row<>stringgrid1.RowCount-1 then
 begin
  client_dir:= stringReplace(Cur_Dir,'EXEC\','',[rfReplaceAll]);
  if not DirectoryExists(client_dir+'KMERP\') then
   Createdir(client_dir+'KMERP\');
  if not directoryexists(client_dir+'KMERP\DATA\') then
   createdir(client_dir+'KMERP\DATA\');

  vfile:=pchar(client_dir+'KMERP\DATA\'+trim(stringgrid1.Cells[0,stringgrid1.Row]));
  ShellExecute(0,
               'open',
               vfile,
               nil,
               nil,
               SW_SHOWNORMAL);
 end;              
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var
  i:integer;
  client_dir:string;
begin
  Application.CreateForm(TFrmGetfile, FrmGetfile);
  frmgetfile.SpinEdit1.Value:=self.SpinEdit1.Value;

  client_dir:= stringReplace(Cur_Dir,'EXEC\','',[rfReplaceAll]);
  if not DirectoryExists(client_dir+'KMERP\') then
   Createdir(client_dir+'KMERP\');
  if not directoryexists(client_dir+'KMERP\DATA\') then
   createdir(client_dir+'KMERP\DATA\');

  FrmGetfile.fileListBox1.Directory := client_dir+'KMERP\DATA\';
     //'r:\kmerp\data\';
  if FrmGetfile.showmodal=mrOk then
   begin
    Adodata0524.append ;
    i:=length(trim(FrmGetfile.FileListBox1.Directory));
    Adodata0524.FieldByName('report_file').asstring :=
    copy(FrmGetfile.FileListBox1.FileName,i+2,length(FrmGetfile.FileListBox1.FileName)-i-1) ;
    Adodata0524.FieldByName('fyear').asstring := FrmGetfile.SpinEdit1.text;
    Adodata0524.post;
    Stringgrid1.RowCount :=Stringgrid1.RowCount +1;
    Stringgrid1.Cells[0,Stringgrid1.RowCount-2]:=Adodata0524.fieldbyname('report_file').asstring;
    Stringgrid1.Cells[1,Stringgrid1.RowCount-2]:= FrmGetfile.SpinEdit1.text;
   end;
  Stringgrid1.Cells[0,Stringgrid1.RowCount-1]:='';
  Stringgrid1.Cells[1,Stringgrid1.RowCount-1]:='';
  FrmGetfile.free;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
var
  i:integer;
  search_option:tlocateoptions;
begin
 search_option := [lopartialkey];
 if Adodata0524.locate('report_file',Stringgrid1.Cells[0,Stringgrid1.Row],search_option) then
  begin
  Adodata0524.delete;
  with Stringgrid1 do
  for i:=Stringgrid1.Row to Stringgrid1.RowCount-2 do
    Stringgrid1.Rows[i]:=Stringgrid1.Rows[i+1];
  Stringgrid1.RowCount :=Stringgrid1.RowCount-1;
  end;
end;

procedure TFrmMain.BitBtn4Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

   Cur_Dir:=uppercase(GetCurrentDir)+'\'; 
end;

procedure TFrmMain.dispalyexecname;
VAR
  i:integer;
begin
  Adodata0524.Close;
  adodata0524.Parameters[0].Value:=self.SpinEdit1.Value;
  Adodata0524.open;
  Stringgrid1.RowCount := self.ADOData0524.RecordCount+2;
  Stringgrid1.Cells[0,0]:='文件列表';
  Stringgrid1.Cells[1,0]:='会计年度';

  AdoData0524.First ;
  for i:=1 to self.ADOData0524.RecordCount do
   begin
    Stringgrid1.Cells[0,i]:=Adodata0524.fieldbyname('report_file').asstring;
    Stringgrid1.Cells[1,i]:=Adodata0524.fieldbyname('fyear').asstring;
    AdoData0524.Next;
   end;
  AdoData0524.First ;   
  Stringgrid1.Cells[0,Stringgrid1.RowCount-1]:='';
  Stringgrid1.Cells[1,Stringgrid1.RowCount-1]:='';
end;

procedure TFrmMain.SpinEdit1Change(Sender: TObject);
begin
 dispalyexecname;
end;

end.
