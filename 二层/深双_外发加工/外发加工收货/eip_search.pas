unit eip_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TForm_episearch = class(TForm)
    Aqwz300: TADOQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Aqwz301: TADOQuery;
    Aqwz300rkey: TAutoIncField;
    Aqwz300epiboly_number: TStringField;
    Aqwz300DEPT_NAME: TStringField;
    Aqwz300DEPT_CODE: TStringField;
    Aqwz300CODE: TStringField;
    Aqwz300SUPPLIER_NAME: TStringField;
    Aqwz300ABBR_NAME: TStringField;
    Aqwz300WAREHOUSE_CODE: TStringField;
    Aqwz300WAREHOUSE_NAME: TStringField;
    Aqwz300warehouse_abbname: TStringField;
    Aqwz300ent_data: TDateTimeField;
    Aqwz300EMPL_CODE: TStringField;
    Aqwz300EMPLOYEE_NAME: TStringField;
    Aqwz300currency_ptr: TIntegerField;
    Aqwz300exch_rate: TBCDField;
    Aqwz301RKEY: TAutoIncField;
    Aqwz301EPIBOLY_PTR: TIntegerField;
    Aqwz301CUSTPART_PTR: TIntegerField;
    Aqwz301QUANTITY: TIntegerField;
    Aqwz301RECEVIED_QTY: TIntegerField;
    Aqwz301UNIT_NAME: TStringField;
    Aqwz301STANDARD: TStringField;
    Aqwz301AREA_SQM: TBCDField;
    Aqwz301AREA_SQF: TBCDField;
    Aqwz301LAYER: TWordField;
    Aqwz301THINK: TBCDField;
    Aqwz301MIN_aperture: TBCDField;
    Aqwz301REQ_DATE: TDateTimeField;
    Aqwz301REMARTK: TStringField;
    Aqwz300TAX_cate: TStringField;
    Aqwz300pay_method: TStringField;
    Aqwz300status: TWordField;
    Aqwz300supp_ptr: TIntegerField;
    Aqwz301RETURN_QTY: TIntegerField;
    Aqwz301rece_qty: TIntegerField;
    Aqwz301reject_qty: TIntegerField;
    Aqwz301MANU_PART_NUMBER: TStringField;
    Aqwz301MANU_PART_DESC: TStringField;
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    Aqwz300remark: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Aqwz300AfterScroll(DataSet: TDataSet);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   field_name:string;
   FMainSql: string;
  public
    { Public declarations }
  end;

var
  Form_episearch: TForm_episearch;

implementation

uses data_module;

{$R *.dfm}

procedure TForm_episearch.FormCreate(Sender: TObject);
begin
  FMainSql := Aqwz300.SQL.Text;
self.Aqwz300.Open;
self.Aqwz301.Open;
if self.Aqwz300.IsEmpty then
 bitbtn1.Enabled:=false;
field_name:='epiboly_number';
end;

procedure TForm_episearch.DBGrid1DblClick(Sender: TObject);
begin
if not Aqwz300.IsEmpty then ModalResult :=mrok;
end;

procedure TForm_episearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not Aqwz300.IsEmpty) then ModalResult :=mrok;
end;

procedure TForm_episearch.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
 begin
  self.Aqwz300.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%''';
 end
 else
 begin
  self.Aqwz300.Filter:='';
 end;
if self.Aqwz300.IsEmpty then
 bitbtn1.Enabled:=false
else
 bitbtn1.Enabled:=true;
end;

procedure TForm_episearch.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;    
 end;
end;

procedure TForm_episearch.Aqwz300AfterScroll(DataSet: TDataSet);
begin
  Aqwz301.Close;
  Aqwz301.Parameters[0].Value := Aqwz300.fieldbyname('rkey').Value;
  Aqwz301.Open;
end;

procedure TForm_episearch.edt1KeyPress(Sender: TObject; var Key: Char);
var
  LSql: string;
  LFilter: string;
begin
  if Key = #13 then
  begin
    if Trim(edt1.Text) <> '' then
    begin
      LSql := ' select d301.EPIBOLY_PTR from wzdata301 d301 ' +
        ' inner join data0025 d25 on d301.CUSTPART_PTR = d25.rkey ' +
        ' where d25.manu_part_number like ' + QuotedStr('%'+edt1.Text+'%') +
        ' group by d301.EPIBOLY_PTR ' ;
      if dm.SqlOpen(LSql) then
      begin
        if not dm.qrytmp.IsEmpty then
        begin
          dm.qrytmp.First;
          while not dm.qrytmp.Eof do
          begin
            LFilter := LFilter + ',' + dm.qrytmp.fieldbyname('EPIBOLY_PTR').AsString;
            dm.qrytmp.Next;
          end;
          LFilter := '(0' + LFilter + ')';
        end else
          LFilter := '(0)';
      end;
    end else
    begin
      LFilter := '';
    end;
    if LFilter <> '' then
    begin
      Aqwz300.SQL.Text := FMainSql + ' and WZDATA300.rkey in ' + LFilter;
    end else
      Aqwz300.SQL.Text := FMainSql;
    Aqwz300.Close;
    Aqwz300.Open;
    Edit1Change(Edit1);
  end;
end;

end.
