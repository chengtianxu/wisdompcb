unit AcctSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, DBTables, StdCtrls, Grids, DBGrids, ADODB, ExtCtrls;

type
  TFrmAcctSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    Button2: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    
    PreColumn: TColumn;
  public
    { Public declarations }
  end;

var
  FrmAcctSearch: TFrmAcctSearch;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmAcctSearch.Edit1Change(Sender: TObject);
begin
IF TRIM(EDIT1.TEXT)<>'' THEN
 if self.RadioGroup1.ItemIndex=0 then
  dm.adodata0103.Filter := PreColumn.FieldName+' like '''+trim(EDIT1.TEXT)+'%'''
 else
  dm.adodata0103.Filter := PreColumn.FieldName+' like ''%'+trim(EDIT1.TEXT)+'%'''
ELSE
  dm.adodata0103.FILTER := '';
end;

procedure TFrmAcctSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TFrmAcctSearch.Button1Click(Sender: TObject);
begin
{with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0128 where GL_ACCT_PTR='+dm.adodata0103rkey.AsString);
  open;
 end;
if not dm.ADOQuery1.IsEmpty then
 begin
  messagedlg('该科目连接有现金帐户,不能选取!',mtinformation,[mbok],0);
 end
else}
// begin
//  dm.ADOQuery1.Close;
  ModalResult:=mrok;
// end;
end;

procedure TFrmAcctSearch.FormCreate(Sender: TObject);
begin
 dm.ADOData0103.Close;
 dm.ADOData0103.Prepared;
 dm.adodata0103.Open;
// field_name:='GL_ACC_NUMBER';
 PreColumn:=dbgrid1.Columns[0];
end;

procedure TFrmAcctSearch.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (column.FieldName<>PreColumn.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
//  self.field_name:=column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn:= Column;
  edit1.SetFocus;
 end;
end;

procedure TFrmAcctSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not dm.adodata0103.IsEmpty) then button1click(sender);
end;

procedure TFrmAcctSearch.DBGrid1DblClick(Sender: TObject);
begin
 if (not dm.adodata0103.IsEmpty) then button1click(sender);
end;

procedure TFrmAcctSearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if dm.adodata0103.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
