unit ExcelImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Comobj, TLHelp32, Grids,
  DBGrids, DB, ADODB;

type
  TfrmExcelImport = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    edtFile: TEdit;
    btn1: TSpeedButton;
    lbl1: TLabel;
    dlgOpen1: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    rg1: TRadioGroup;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    dbgrd1: TDBGrid;
    qry1: TADOQuery;
    ds1: TDataSource;
    lbl2: TLabel;
    pb1: TProgressBar;
    qryImport: TADOQuery;
    qryImportWAREHOUSE_CODE: TStringField;
    qryImportDEPT_CODE: TStringField;
    qryImportINV_PART_NUMBER: TStringField;
    qryImportQUAN: TFloatField;
    qryImportSTD_PRICE: TFloatField;
    lbl3: TLabel;
    lbl4: TLabel;
    con1: TADOConnection;
    procedure btn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
    ExcelApp: Variant;
  public
    { Public declarations }
  end;

var
  frmExcelImport: TfrmExcelImport;

implementation

uses Unit1;

{$R *.dfm}

procedure TfrmExcelImport.btn1Click(Sender: TObject);
begin
 if  dlgOpen1.Execute then
 begin
   edtFile.Text:= dlgOpen1.FileName;
 end;
end;

procedure TfrmExcelImport.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  if edtFile.Text='' then
  begin
    Application.MessageBox('请选择需导入的Excel文件!','提示',mb_ok);
  end;
  try
    ExcelApp.WorkBooks.Open(trim(edtFile.Text));
    con1.Connected:=False ;
    qry1.Active :=False ;
    con1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=';
    con1.ConnectionString:=con1.ConnectionString+trim(edtFile.Text);
    con1.ConnectionString:=con1.ConnectionString+';Extended Properties=excel 8.0;Persist Security Info=false';
    con1.LoginPrompt:=False ;
    con1.Connected:=True;
    rg1.Items.Clear;
    for i:=1 to ExcelApp.ActiveWorkbook.WorkSheets.Count do
      rg1.Items.Add(ExcelApp.ActiveWorkbook.WorkSheets[i].Name);
    rg1.ItemIndex:=0;
    pgc1.ActivePageIndex:= 1;
  except
    ExcelApp.WorkBooks.Close;
  end;
end;

procedure TfrmExcelImport.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmExcelImport.FormShow(Sender: TObject);
begin
  ts1.TabVisible:= False;
  ts2.TabVisible:= False;
  ts3.TabVisible:= False;
  ts4.TabVisible:= False;
  pgc1.ActivePageIndex:= 0;
  ExcelApp:= CreateOleObject('Excel.Application');
end;

procedure TfrmExcelImport.FormClose(Sender: TObject;
  var Action: TCloseAction);
  procedure EndProcess(AFileName: string);
  const
    PROCESS_TERMINATE=$0001;
  var
    ExeFileName: String;
    ContinueLoop: BOOL;
    FSnapshotHandle: THandle;
    FProcessEntry32: TProcessEntry32;
  begin
    ExeFileName := AFileName;
    FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
    ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);
    while integer(ContinueLoop) <> 0 do
      begin
        if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))=UpperCase(ExeFileName))
         or (UpperCase(FProcessEntry32.szExeFile)=UpperCase(ExeFileName))) then
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),FProcessEntry32.th32ProcessID), 0);
        ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
      end;
  end;
begin
  if ExcelApp.WorkBooks.Count<>0 then
  begin
   try
     ExcelApp.WorkBooks.Close;
   except
   end;
  end;
  EndProcess('Excel.exe');
  Action:= Cafree;
end;

procedure TfrmExcelImport.BitBtn3Click(Sender: TObject);
begin
  qry1.close;
  qry1.SQL.Clear;
  qry1.sql.Add('SELECT * FROM ['+rg1.Items[rg1.ItemIndex]+'$]');
  qry1.open;
  pgc1.ActivePageIndex:= 3;
end;

procedure TfrmExcelImport.BitBtn4Click(Sender: TObject);
begin
  if ExcelApp.activeWorkBook.WorkSheets.Count<>0 then
    ExcelApp.WorkBooks.Close;
  pgc1.ActivePageIndex:= 0;
end;

procedure TfrmExcelImport.BitBtn5Click(Sender: TObject);
var
  iSuccess,iFail: Integer;
begin
  iSuccess:= 0;
  iFail:= 0;
  pgc1.ActivePageIndex:=2;

  BitBtn7.Visible:= False;
  lbl2.Caption:='数据导入中，请稍候。。。';
  with qry1 do
  begin
    try
      close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ['+rg1.Items[rg1.ItemIndex]+'$]');
      open;
    except
      on E:Exception do
      begin
        ShowMessage(E.Message);
        lbl2.Caption:= '数据导入失败！'+E.Message;
        pb1.Position:=0;
        BitBtn7.Visible:= True;
        Abort;
      end;
    end;      
    Application.ProcessMessages;
    pb1.StepBy(1);
    pb1.Max:= qry1.RecordCount+1;
    First;
    while not qry1.Eof do
    begin
      try
        with qryImport do
        begin
          Close;
          Parameters.ParamByName('rkey53').Value:= qry1.Fields[0].AsString;;
          Parameters.ParamByName('price').Value:= qry1.Fields[1].AsString;;
          ExecSQL;
        end;
        Inc(iSuccess);
      except
        Inc(iFail);
      end;
      Application.ProcessMessages;
      pb1.StepBy(1);
      Next;
    end;
    lbl2.Caption:='数据导入成功'+IntToStr(iSuccess)+'行，失败'+IntToStr(iFail)+'行！';
    BitBtn7.Visible:= True;
  end;
end;

procedure TfrmExcelImport.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmExcelImport.BitBtn7Click(Sender: TObject);
begin
  Close;
  Form1.btnQuery.Click;
end;

procedure TfrmExcelImport.BitBtn8Click(Sender: TObject);
begin
  pgc1.ActivePageIndex:= 1;
end;

end.
