unit stock_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, DB, ADODB, Provider,
  DBClient,Buttons,Menus;
type
  TForm_Stock = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    dsInvent: TDataSource;
    cdsInvent: TClientDataSet;
    dspInvent: TDataSetProvider;
    aqInvent: TADOQuery;
    Button2: TButton;
    Button1: TButton;
    aqInventRKEY: TAutoIncField;
    aqInventwhouse: TStringField;
    aqInventlocation: TStringField;
    aqInventwo_number: TStringField;
    aqInventplace: TStringField;
    aqInventMFG_DATE: TDateTimeField;
    aqInventQTY_AVAIL: TFloatField;
    aqInventD06RKEY: TAutoIncField;
    aqInventNPAD_PTR: TIntegerField;
    aqInventabbr23: TStringField;
    aqInventIsSelected: TWordField;
    cdsInventIsSelected: TSmallintField;
    cdsInventRKEY: TAutoIncField;
    cdsInventwhouse: TStringField;
    cdsInventlocation: TStringField;
    cdsInventwo_number: TStringField;
    cdsInventplace: TStringField;
    cdsInventMFG_DATE: TDateTimeField;
    cdsInventQTY_AVAIL: TFloatField;
    cdsInventD06RKEY: TAutoIncField;
    cdsInventNPAD_PTR: TIntegerField;
    cdsInventabbr23: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure cdsInventIsSelectedChange(Sender: TField);
  private
    { Private declarations }
//    PreColumn: TColumnEh;
//    field_name:string;
    count:Integer;
  public
    { Public declarations }
  end;

var
  Form_Stock: TForm_Stock;

implementation

uses damo, detail;

{$R *.dfm}

procedure TForm_Stock.FormShow(Sender: TObject);
begin
  cdsInvent.Close;
  cdsInvent.Open;
  if cdsInvent.IsEmpty then
  DBGridEh1.Enabled:=False;
  Label3.Caption:=fm_detail.Edit12.Text;
  Label5.Caption:='0';
  count:=0;
end;

procedure TForm_Stock.Edit1Change(Sender: TObject);
begin
 if cdsInvent.Modified=False then
 begin
  if trim(edit1.Text)<>'' then
  cdsInvent.Filter := 'wo_number'+' like ''%'+Trim(Edit1.Text)+'%'''
  else
  cdsInvent.Filter := '';
 end;
end;



procedure TForm_Stock.cdsInventIsSelectedChange(Sender: TField);
begin
 if cdsInventIsSelected.Value=1 then
  count:=count+cdsinventQTY_AVAIL.AsInteger
 else
  count:=count-cdsinventQTY_AVAIL.AsInteger;
  Label5.Caption:=IntToStr(count);
end;

end.
