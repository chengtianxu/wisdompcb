unit Datail3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,ComObj, Excel97,
  DBGrids, DBCtrls, Menus;
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs,  StdCtrls, ExtCtrls, Grids, DBGrids, Menus,ComObj, Excel97;


type
  TFrmDetail3 = class(TForm)
    Splitter1: TSplitter;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  FrmDetail3: TFrmDetail3;

implementation

uses main, Report3, Report4, Report5, Report6;

{$R *.dfm}

procedure TFrmDetail3.SpeedButton1Click(Sender: TObject);
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

procedure TFrmDetail3.SpeedButton2Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmDetail3.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmDetail3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmMain.Ado0112.Close;
end;

procedure TFrmDetail3.N1Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport3, FrmReport3);
    FrmReport3.ppLabel35.Caption:='<='+datetostr(FrmMain.datetimepicker1.Date);
    FrmReport3.PPLabel36.Caption:='<='+datetostr(FrmMain.datetimepicker2.Date);
    FrmReport3.PPLabel37.Caption:='<='+datetostr(FrmMain.datetimepicker3.Date);
    FrmReport3.PPLabel38.Caption:='<='+datetostr(FrmMain.datetimepicker4.Date);
    FrmReport3.PPLabel39.Caption:='<='+datetostr(FrmMain.datetimepicker5.Date);
    FrmReport3.PPLabeL40.Caption:='>'+datetostr(FrmMain.datetimepicker5.Date);
    if FrmMain.checkbox1.Checked then
    try
      FrmReport3.PPLabeL40.Visible :=false;
      FrmReport3.ppDBText2.Visible :=false;
    except
    end;
    FrmReport3.ppReport1.Print;
    FrmReport3.Free ;
end;

procedure TFrmDetail3.N2Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport4, FrmReport4);
    FrmReport4.ppLabel35.Caption:='<='+datetostr(FrmMain.datetimepicker1.Date);
    FrmReport4.PPLabel36.Caption:='<='+datetostr(FrmMain.datetimepicker2.Date);
    FrmReport4.PPLabel37.Caption:='<='+datetostr(FrmMain.datetimepicker3.Date);
    FrmReport4.PPLabel38.Caption:='<='+datetostr(FrmMain.datetimepicker4.Date);
    FrmReport4.PPLabel39.Caption:='<='+datetostr(FrmMain.datetimepicker5.Date);
    FrmReport4.PPLabeL40.Caption:='>'+datetostr(FrmMain.datetimepicker5.Date);
    if FrmMain.checkbox1.Checked then
    try
      FrmReport4.PPLabeL40.Visible :=false;
      FrmReport4.ppDBText2.Visible :=false;
    except
    end;
    FrmReport4.ppReport1.Print;
    FrmReport4.Free ;
end;

procedure TFrmDetail3.N3Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport5, FrmReport5);
    FrmReport5.ppLabel35.Caption:='<='+datetostr(FrmMain.datetimepicker1.Date);
    FrmReport5.PPLabel36.Caption:='<='+datetostr(FrmMain.datetimepicker2.Date);
    FrmReport5.PPLabel37.Caption:='<='+datetostr(FrmMain.datetimepicker3.Date);
    FrmReport5.PPLabel38.Caption:='<='+datetostr(FrmMain.datetimepicker4.Date);
    FrmReport5.PPLabel39.Caption:='<='+datetostr(FrmMain.datetimepicker5.Date);
    FrmReport5.PPLabeL40.Caption:='>'+datetostr(FrmMain.datetimepicker5.Date);
    if FrmMain.checkbox1.Checked then
    try
      FrmReport5.PPLabeL40.Visible :=false;
      FrmReport5.ppDBText2.Visible :=false;
    except
    end;
    FrmReport5.ppReport1.Print;
    FrmReport5.Free ;
end;

procedure TFrmDetail3.N4Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport6, FrmReport6);
    FrmReport6.ppLabel35.Caption:='<='+datetostr(FrmMain.datetimepicker1.Date);
    FrmReport6.PPLabel36.Caption:='<='+datetostr(FrmMain.datetimepicker2.Date);
    FrmReport6.PPLabel37.Caption:='<='+datetostr(FrmMain.datetimepicker3.Date);
    FrmReport6.PPLabel38.Caption:='<='+datetostr(FrmMain.datetimepicker4.Date);
    FrmReport6.PPLabel39.Caption:='<='+datetostr(FrmMain.datetimepicker5.Date);
    FrmReport6.PPLabeL40.Caption:='>'+datetostr(FrmMain.datetimepicker5.Date);
    if FrmMain.checkbox1.Checked then
    try
      FrmReport6.PPLabeL40.Visible :=false;
      FrmReport6.ppDBText2.Visible :=false;
    except
    end;
    FrmReport6.ppReport1.Print;
    FrmReport6.Free ;
end;

procedure TFrmDetail3.BitBtn5Click(Sender: TObject);
begin
 PopupMenu2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TFrmDetail3.item_click(sender:TObject);
var i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TFrmDetail3.FormShow(Sender: TObject);
var
 i:integer;
 item:TMenuItem;
begin
   for i:=1 to dbgrid1.FieldCount do
    begin
     item:=TmenuItem.Create(self);
     item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
     if dbgrid1.Columns[i-1].Visible then
      item.Checked:=true;
     item.OnClick := item_click;
     self.PopupMenu2.Items.Add(item);
    end;
end;

end.
