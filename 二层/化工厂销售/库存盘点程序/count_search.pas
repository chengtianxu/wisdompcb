unit count_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_loc_search = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    adoquery1RKEY: TAutoIncField;
    adoquery1CODE: TStringField;
    adoquery1LOCATION: TStringField;
    adoquery1LOCATION_TYPE: TWordField;
    adoquery1whouse_ptr: TIntegerField;
    adoquery1: TADOQuery;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_loc_search: TForm_loc_search;

implementation

uses main , count_add, damo;
{$R *.dfm}

procedure TForm_loc_search.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;

procedure TForm_loc_search.DBGrid1DblClick(Sender: TObject);
begin
ModalResult:=mrok;
end;

procedure TForm_loc_search.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'½è´û·½Ïò' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='CODE' then
  begin
   label1.Caption:='²Ö¿â±àºÅ:';
   column.Title.Color:=clred;
   EDIT1.SetFocus;
   end
   else if column.FieldName='LOCATION' then
  begin
   label1.Caption:='²Ö¿âÃû³Æ:';
   column.Title.Color:=clred ;
   EDIT1.SetFocus;
  end;
 end;
end;

procedure TForm_loc_search.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
 begin
  if trim(label1.Caption)='²Ö¿â±àºÅ:' then
  adoquery1.Filter:='CODE like '''+trim(EDIT1.TEXT)+'%'''
 else
 //if trim(label1.Caption)='²Ö¿âÃû³Æ:' then
   adoquery1.Filter:='LOCATION like '''+trim(EDIT1.TEXT)+'%''';
 end
 else adoquery1.Filter:='';

end;

procedure TForm_loc_search.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_loc_search.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_loc_search.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_loc_search.FormCreate(Sender: TObject);
begin
adoquery1.Open;
end;

end.
