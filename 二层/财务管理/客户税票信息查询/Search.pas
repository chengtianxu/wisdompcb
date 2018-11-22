unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TFrm_Search = class(TForm)
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    ListBox1: TListBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    StaticText2: TStaticText;
    SGrd: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row: byte);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Search: TFrm_Search;

implementation

{$R *.dfm}

procedure TFrm_Search.ListBox1Click(Sender: TObject);
begin
  Label1.Caption:=ListBox1.Items[ListBox1.ItemIndex];
  Edit1.Text:='';
end;

procedure TFrm_Search.FormShow(Sender: TObject);
begin
  ListBox1.ItemIndex:=0;
  SGrd.Cells[0,0]:='条件名';
  SGrd.Cells[1,0]:='条件值';
  ListBox1Click(nil);
end;

procedure TFrm_Search.Button1Click(Sender: TObject);
var
  i:Byte;
begin
  for i := 1 to SGrd.RowCount-2 do
  begin
    if SGrd.Cells[0,i]=ListBox1.Items[ListBox1.ItemIndex] then
    begin
      update_sgrid(i);
      Exit;
    end;
  end;
  update_sgrid(SGrd.RowCount-1);
  SGrd.RowCount:=SGrd.RowCount+1;
end;

procedure TFrm_Search.update_sgrid(sgrid_row: byte);
begin
  SGrd.Cells[0,sgrid_row]:=ListBox1.Items[ListBox1.itemIndex];
  SGrd.Cells[1,sgrid_row]:=Trim(Edit1.Text);
  case ListBox1.ItemIndex of
    0: SGrd.Cells[2,sgrid_row]:=' and TAX_NO like ''%'+trim(Edit1.Text)+'%''';
    1: SGrd.Cells[2,sgrid_row]:=' and invoice_number like ''%'+trim(Edit1.Text)+'%''';
    2: SGrd.Cells[2,sgrid_row]:=' and delivery_no like ''%'+trim(Edit1.Text)+'%''';
    3: SGrd.Cells[2,sgrid_row]:=' and SALES_ORDER like ''%'+trim(Edit1.Text)+'%''';
  else SGrd.Cells[2,sgrid_row]:=' and cust_decl like ''%'+trim(Edit1.Text)+'%''';
  end;

end;

procedure TFrm_Search.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Search.Button2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
