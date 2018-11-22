unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons, Menus;

type
  TFrm_Search = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    StaticText2: TStaticText;
    SGrd1: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    dtpk1: TDateTimePicker;
    Label3: TLabel;
    dtpk2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure update_sgrid(sgrid_row: byte);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Search: TFrm_Search;

implementation
uses cust_search ;

{$R *.dfm}

procedure TFrm_Search.FormShow(Sender: TObject);
begin
  SGrd1.Cells[0,0]:='条件名';
  SGrd1.Cells[1,0]:='条件值';
  ListBox1.ItemIndex:=0;
  ListBox1Click(Sender);
end;

procedure TFrm_Search.ListBox1Click(Sender: TObject);
begin
  Label1.Caption:=ListBox1.Items[ListBox1.ItemIndex];
  Edit1.Visible:=True;
  Edit1.Text:='';
  BitBtn1.Visible:=False;
  Button1.Enabled:=False;
  BitBtn1.Visible:=True;
  case ListBox1.ItemIndex of
    0: BitBtn1.Visible:=True;
    1: BitBtn1.Visible:=False;
    2: BitBtn1.Visible:=False;
    3: BitBtn1.Visible:=False;
    4: BitBtn1.Visible:=False;
  end;
  Edit1.SetFocus;
end;

procedure TFrm_Search.Button1Click(Sender: TObject);
var
  i:byte;
begin
  for i:=1 to SGrd1.RowCount-2 do
   if SGrd1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
   begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(SGrd1.RowCount-1);
  SGrd1.RowCount:=SGrd1.RowCount+1;
end;

procedure TFrm_Search.update_sgrid(sgrid_row: byte);
begin
  SGrd1.Cells[0,sgrid_row]:=ListBox1.Items[ListBox1.itemIndex];
  case ListBox1.ItemIndex of
    0:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and data0010.rkey='+ IntToStr(Edit1.Tag);
    end;
    1:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and data0060.SALES_ORDER like ''%'+trim(Edit1.Text)+'%''';
    end;
    2:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and data0025.MANU_PART_NUMBER like ''%'+trim(Edit1.Text)+'%''';
    end;
    3:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and data0025.MANU_PART_DESC like ''%'+trim(Edit1.Text)+'%''';
    end;
    4:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and data0097.PO_NUMBER like ''%'+trim(Edit1.Text)+'%''';
    end;
  end;
end;

procedure TFrm_Search.Button2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_Search.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Search.BitBtn1Click(Sender: TObject);
begin
  form_custmer:=tform_custmer.Create(application);
  if form_custmer.ShowModal=mrok then
  begin
    Edit1.Text:=form_custmer.ADOQuery1cust_code.Value;
    Edit1.Tag:=Form_Custmer.ADOQuery1rkey.Value;
  end;
  Button1.Enabled:=True;
  form_custmer.Free;
end;

procedure TFrm_Search.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  Button1.Enabled:=True;
end;

procedure TFrm_Search.N1Click(Sender: TObject);
var
  i:Byte;
begin
  if SGrd1.RowCount>2 then
  begin
    for i:=SGrd1.Row to SGrd1.RowCount-2 do
      SGrd1.Rows[i].Text:=SGrd1.Rows[i+1].Text;
    SGrd1.RowCount:=SGrd1.RowCount-1;
  end
  else SGrd1.Rows[SGrd1.Row].Clear;
end;

end.
