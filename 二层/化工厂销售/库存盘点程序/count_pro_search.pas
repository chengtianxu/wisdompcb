unit count_pro_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TForm_pro_search = class(TForm)
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
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1PR_GRP_CODE: TStringField;
    ADOQuery1PRODUCT_GROUP_NAME: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_pro_search: TForm_pro_search;

implementation
uses main ,damo;

{$R *.dfm}

procedure TForm_pro_search.DBGrid1DblClick(Sender: TObject);
begin
ModalResult:=mrok;
end;

procedure TForm_pro_search.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_pro_search.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_pro_search.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_pro_search.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
 begin
  if  trim(label1.Caption)='产品类型编号:' then
  adoquery1.Filter:='PR_GRP_CODE like '''+trim(EDIT1.TEXT)+'%'''
 else
   adoquery1.Filter:='PRODUCT_GROUP_NAME like '''+trim(EDIT1.TEXT)+'%''' ;
 end
else  adoquery1.Filter:='';
end;

procedure TForm_pro_search.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'借贷方向' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='PR_GRP_CODE' then
  begin
   label1.Caption:='产品类型编号:';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
   else if column.FieldName='PRODUCT_GROUP_NAME' then
  begin
   label1.Caption:='产品类型名称:';
   column.Title.Color:=clred ;
  edit1.SetFocus;
  end;
 end;
end;

procedure TForm_pro_search.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then DBGrid1DblClick(sender);
end;

procedure TForm_pro_search.FormCreate(Sender: TObject);
begin
ADOQuery1.Open;
end;

end.
