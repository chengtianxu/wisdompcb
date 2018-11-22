unit locser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, Buttons;

type
  TForm_locser = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1WAREHOUSE_CODE: TStringField;
    ADOQuery1WAREHOUSE_NAME: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_locser: TForm_locser;

implementation
uses main,damo;

{$R *.dfm}

procedure TForm_locser.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_locser.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
 begin
  if  trim(label1.Caption)='工厂编号:' then
  adoquery1.Filter:='WAREHOUSE_CODE like '''+trim(EDIT1.TEXT)+'%'''
 else
   adoquery1.Filter:='WAREHOUSE_NAME like '''+trim(EDIT1.TEXT)+'%''' ;
 end
else  adoquery1.Filter:='';
end;

procedure TForm_locser.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_locser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;

procedure TForm_locser.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'借贷方向' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='WAREHOUSE_CODE' then
  begin
   label1.Caption:='工厂编号:';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
   else if column.FieldName='WAREHOUSE_NAME' then
  begin
   label1.Caption:='工厂名称:';
   column.Title.Color:=clred ;
  edit1.SetFocus;
  end;
 end;
end;

procedure TForm_locser.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_locser.FormCreate(Sender: TObject);
begin
ADOQuery1.Open;
end;

procedure TForm_locser.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

end.
