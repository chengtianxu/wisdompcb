unit supplyser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  TForm_supplyser = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1CODE: TStringField;
    ADOQuery1SUPPLIER_NAME: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_supplyser: TForm_supplyser;

implementation
uses main ,damo;

{$R *.dfm}

procedure TForm_supplyser.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_supplyser.FormCreate(Sender: TObject);
begin
self.ADOQUERY1.Open;
end;

procedure TForm_supplyser.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_supplyser.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_supplyser.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
 begin
  if  trim(label1.Caption)='供应商编号：' then
  adoquery1.Filter:='CODE like '''+trim(EDIT1.TEXT)+'%'''
 else
   adoquery1.Filter:='SUPPLIER_NAME like '''+trim(EDIT1.TEXT)+'%''' ;
 end
else  adoquery1.Filter:='';
end;

procedure TForm_supplyser.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'借贷方向' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='CODE' then
  begin
   label1.Caption:='供应商编号：';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
   else if column.FieldName='SUPPLIER_NAME' then
  begin
   label1.Caption:='供应商名称:';
   column.Title.Color:=clred ;
  edit1.SetFocus;
  end;
 end;
end;

procedure TForm_supplyser.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_supplyser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;

end.
