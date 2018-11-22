unit orderser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TForm_orderser = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQUERY1: TADODataSet;
    ADOQUERY1PO_NUMBER: TStringField;
    ADOQUERY1DESCRIPTION: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_orderser: TForm_orderser;

implementation
uses main ,damo;

{$R *.dfm}

procedure TForm_orderser.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_orderser.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_orderser.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_orderser.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_orderser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;

procedure TForm_orderser.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
 begin
  if  trim(label1.Caption)='订单号:' then
  adoquery1.Filter:='PO_NUMBER like '''+trim(EDIT1.TEXT)+'%'''
 else
   adoquery1.Filter:='DESCRIPTION like '''+trim(EDIT1.TEXT)+'%''' ;
 end
else  adoquery1.Filter:='';
end;

procedure TForm_orderser.FormCreate(Sender: TObject);
begin
ADOQUERY1.Open;
end;

procedure TForm_orderser.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'借贷方向' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='PO_NUMBER' then
  begin
   label1.Caption:='订单号:';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
   else if column.FieldName='DESCRIPIONG' then
  begin
   label1.Caption:='产品名称:';
   column.Title.Color:=clred ;
  edit1.SetFocus;
  end;
 end;
end;

end.
