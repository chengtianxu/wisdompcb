unit part_quantity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids, Menus,ComObj, Excel2000,ClipBrd;

type
  TForm4 = class(TForm)
    Aq53: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Aq53MANU_PART_NUMBER: TStringField;
    Aq53MANU_PART_DESC: TStringField;
    Aq53PROD_CODE: TStringField;
    Aq53PRODUCT_NAME: TStringField;
    Aq53CUST_CODE: TStringField;
    Aq53CUSTOMER_NAME: TStringField;
    Aq53ABBR_NAME: TStringField;
    Aq53QTY_ON_HAND: TIntegerField;
    Aq53ANALYSIS_CODE_2: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses main, partin_report,common;
{$R *.dfm}
procedure TForm4.NewGridWnd(var Message: TMessage);
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

procedure TForm4.Button1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aq53.SQL.Text);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then  //х╗оч
  begin
   form_report.ppdbtext7.Visible:=false; 
  end;
 aq53.DisableControls;
 form_report.ppReport1.Print;
 aq53.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Aq53.Filter := AQ53.Sort +' like ''%'+trim(edit1.Text)+'%'''
 else
  Aq53.Filter := '';
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
 AQ53.Sort:=Column.FieldName;
 label1.Caption:=Column.Title.Caption;
 edit1.Enabled:=true;
 edit1.SetFocus;
 case Column.Field.Index of
   6,7,9,10,11,17:edit1.Enabled:=false;
 end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  DBGrid1TitleClick(DBGrid1.Columns.Items[1]);
end;

end.
