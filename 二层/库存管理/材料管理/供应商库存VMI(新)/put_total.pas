unit put_total;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000, ClipBrd,
  Buttons;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    adotota207: TADOQuery;
    adotota207INV_PART_NUMBER: TStringField;
    adotota207UNIT_NAME: TStringField;
    adotota207GROUP_DESC: TStringField;
    adotota207ABBR_NAME: TStringField;
    adotota207put_total: TFloatField;
    adotota207put_price: TFloatField;
    adotota207inv_group_name: TStringField;
    Label3: TLabel;
    Edit3: TEdit;
    adotota207INV_NAME: TStringField;
    adotota207INV_DESCRIPTION: TStringField;
    adotota207STOCK_SELL: TFloatField;
    adotota207total_area: TFloatField;
    adotota207put_notax: TBCDField;
    adotota207REPORT_VALUE1: TFloatField;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    adotota207Stype: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;     
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses demo,Condition;

{$R *.dfm}

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form_condition.Show;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm7.Button2Click(Sender: TObject);

 begin
  dm.CopyDbDataToExcel([dbgrid1],self.Caption);
 end;

procedure TForm7.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adotota207.SQL.Text);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm7.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Adotota207.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 adotota207.Filter := '';
end;

procedure TForm7.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>'put_total') and
    (column.FieldName<>'base_price') and
    (column.FieldName<>'put_price') and
    (column.FieldName<>'STOCK_BASE') and
    (column.FieldName<>'total_weigth') and
    (column.FieldName<>'STOCK_SELL') and
    (column.FieldName<>'total_area') and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  adotota207.sort:=column.FieldName+' ASC';
  {with adotota207 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;}
 end;
end;

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm7.BitBtn4Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定导出EXCEL表吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
   dm.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

end.
