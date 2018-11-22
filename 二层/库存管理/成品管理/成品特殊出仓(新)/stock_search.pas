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
    Label4: TLabel;
    Label5: TLabel;
    aqInventRMA_PTR: TIntegerField;
    cdsInventRMA_PTR: TIntegerField;
    aqInventtttype: TStringField;
    cdsInventtttype: TStringField;
    aqInventspec_place: TStringField;
    cdsInventspec_place: TStringField;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure cdsInventIsSelectedChange(Sender: TField);
    procedure aqInventAfterOpen(DataSet: TDataSet);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
//    PreColumn: TColumnEh;
 //   field_name:string;
    count:Integer;
  public
    { Public declarations }
  end;

var
  Form_Stock: TForm_Stock;

implementation

uses damo;

{$R *.dfm}

procedure TForm_Stock.FormShow(Sender: TObject);
begin
//cdsInvent.Close;
//cdsInvent.Open;
  if cdsInvent.IsEmpty then
  DBGridEh1.Enabled:=False;
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

procedure TForm_Stock.aqInventAfterOpen(DataSet: TDataSet);
begin
cdsInvent.Data:=dspInvent.Data;
end;

procedure TForm_Stock.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (Self.cdsInvent.RecNo=Self.cdsInvent.RecordCount) then abort;

 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录

if (chr(key)='V') and (ssalt in shift) then
  showmessage(aqInvent.SQL.Text);
end;

end.
