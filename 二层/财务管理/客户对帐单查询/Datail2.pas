unit Datail2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,ComObj, Excel97,
  DBGrids, DBCtrls;
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs,  StdCtrls, ExtCtrls, Grids, DBGrids, Menus,ComObj, Excel97;


type
  TFrmDetail2 = class(TForm)
    Splitter1: TSplitter;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGridEh;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetail2: TFrmDetail2;

implementation

uses main, Report2;

{$R *.dfm}

procedure TFrmDetail2.SpeedButton1Click(Sender: TObject);
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TMemo;
   ExcelApp: Variant;
 begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := self;
    mem.Clear;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
     sline := sline + DBGrid1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
       sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
    end;

    // we copy the data to the clipboard
    mem.SelectAll;
    mem.CopyToClipboard;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TFrmDetail2.SpeedButton2Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport2, FrmReport2);
    FrmReport2.ppLabel35.Caption:='<='+datetostr(FrmMain.datetimepicker1.Date);
    FrmReport2.PPLabel36.Caption:='<='+datetostr(FrmMain.datetimepicker2.Date);
    FrmReport2.PPLabel37.Caption:='<='+datetostr(FrmMain.datetimepicker3.Date);
    FrmReport2.PPLabel38.Caption:='<='+datetostr(FrmMain.datetimepicker4.Date);
    FrmReport2.PPLabel39.Caption:='<='+datetostr(FrmMain.datetimepicker5.Date);
    FrmReport2.PPLabeL40.Caption:='>'+datetostr(FrmMain.datetimepicker5.Date);
    if FrmMain.checkbox1.Checked then
    try
      FrmReport2.PPLabeL40.Visible :=false;
      FrmReport2.ppDBText2.Visible :=false;
    except
    end;
    FrmReport2.ppReport1.Print;
    FrmReport2.Free ;
end;

procedure TFrmDetail2.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
