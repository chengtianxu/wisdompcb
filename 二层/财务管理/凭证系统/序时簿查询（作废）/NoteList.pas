unit NoteList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, Excel2000, OleServer,
  ExcelXP;

type
  TFrmList = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmList: TFrmList;

implementation

uses ProgressBar, Report0, Main, Datamodule;

{$R *.dfm}

procedure TFrmList.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If arow=0 then
    Stringgrid1.Canvas.TextRect(rect,rect.Left+(rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[acol,arow])-rect.Left) div 2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]	)
  else
  If (acol=5) or (acol=6) then
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[aCol,aRow])-2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]);
end;

procedure TFrmList.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmList.SpeedButton1Click(Sender: TObject);
var
  asheet:TExcelApplication;
  i,j:integer;
  vleng:real;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  asheet:=TExcelApplication.Create(self);
  try
    asheet.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  Excelworksheet1.Disconnect;
  Excelworkbook1.Disconnect ;
  Application.CreateForm(TFrmProgress, FrmProgress);
  FrmProgress.show;
  asheet.Workbooks.Add(null,0);
  Excelworkbook1.ConnectTo(asheet.Workbooks[1]);
  Excelworksheet1.ConnectTo(Excelworkbook1.worksheets[1] as _worksheet);
  with Stringgrid1 do
  for i:=0 to stringgrid1.rowcount-1 do
  for j:=0 to stringgrid1.ColCount-1 do
  begin
    ExcelworkSheet1.cells.Item[i+1,j+1]:=Stringgrid1.cells[j,i];
    vleng:=int(500*(i*stringgrid1.ColCount+j)/(stringgrid1.colcount)/(stringgrid1.rowcount-1));
    FrmProgress.ProgressBar1.Position :=strtoint(floattostr(vleng));
  end;

  FrmProgress.free;
  SaveDialog1.Execute;
  Excelworksheet1.SaveAs(Savedialog1.FileName);
  asheet.quit;
  asheet.disconnect;
  asheet.free;
  Excelworksheet1.Disconnect;
  Excelworkbook1.Disconnect ;
  messagedlg('数据已经被存为'+Savedialog1.FileName+'的EXCEL文件!',mtinformation,[mbok],0);
end;

procedure TFrmList.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport0, FrmReport0);
    FrmReport0.QRLabel5.Caption:=FrmMain.spinedit1.text;
    FrmReport0.QRLabel8.Caption:=FrmMain.spinedit2.text;
    FrmReport0.QuickRep1.Preview ;
    FrmReport0.Free ;
end;

end.
