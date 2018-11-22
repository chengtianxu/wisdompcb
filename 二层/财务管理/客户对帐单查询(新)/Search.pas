unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons;

type
  Tfrm_Search = class(TForm)
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
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row: byte);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Search: Tfrm_Search;

implementation

uses constvar,Pick_Item_Single, dmo;
{$R *.dfm}

procedure Tfrm_Search.BitBtn1Click(Sender: TObject);
var
 inputvar: PDlgInput;
begin
  frmPick_Item_Single:=Tfrmpick_item_single.Create(application);
  inputvar.Fields:='MANU_PART_NUMBER/本厂编号/100,MANU_PART_DESC/客户型号/200,ttype/性质/80';
  inputvar.Sqlstr:='select MANU_PART_NUMBER,MANU_PART_DESC,case ttype when 0 then ''批量'' when 1 then ''样板'' end as ttype from data0025';
  inputvar.AdoConn:=DM.ADOConn;
  frmpick_item_single.InitForm_New(inputvar);
  if (frmPick_Item_Single.ShowModal=mrok) and (not frmPick_Item_Single.adsPick.IsEmpty) then
    Edit1.Text:=frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER'];
  Button1.Enabled:=True;
end;

procedure Tfrm_Search.ListBox1Click(Sender: TObject);
begin
  Label1.Caption:=ListBox1.Items[ListBox1.ItemIndex];
  Edit1.Text:='';
  Button1.Enabled:=False;
  case ListBox1.ItemIndex of
    0: BitBtn1.Visible:=True;
    1: BitBtn1.Visible:=False;
    2: BitBtn1.Visible:=False;
    3: BitBtn1.Visible:=False;
  else BitBtn1.Visible:=False;
  end;
end;

procedure Tfrm_Search.FormShow(Sender: TObject);
begin
  ListBox1.ItemIndex:=0;
  ListBox1Click(nil);
  SGrd.Cells[0,0]:='条件名称';
  SGrd.Cells[1,0]:='条件值';
end;

procedure Tfrm_Search.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Button1.Enabled:=True;
end;

procedure Tfrm_Search.Button1Click(Sender: TObject);
var
  i:byte;
begin
  for i:=1 to SGrd.RowCount-2 do
    if SGrd.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
    begin
      update_sgrid(i);
      exit;
    end;
      update_sgrid(SGrd.RowCount-1);
  SGrd.RowCount:=SGrd.RowCount+1;
end;

procedure TFrm_Search.update_sgrid(sgrid_row: byte);
begin
  SGrd.Cells[0,sgrid_row]:=ListBox1.Items[ListBox1.itemIndex];
  SGrd.Cells[1,sgrid_row]:=Trim(Edit1.Text);
  case ListBox1.ItemIndex of
    0:
      SGrd.Cells[2,sgrid_row]:=' and MANU_PART_NUMBER like ''%'+trim(Edit1.Text)+'%''';
    1:
      SGrd.Cells[2,sgrid_row]:=' and PO_NUMBER like ''%'+trim(Edit1.Text)+'%''';
    2:
      SGrd.Cells[2,sgrid_row]:=' and MANU_PART_DESC like ''%'+trim(Edit1.Text)+'%''';
    3:
      SGrd.Cells[2,sgrid_row]:=' and delivery_no like ''%'+trim(Edit1.Text)+'%''';
    4:
      SGrd.Cells[2,sgrid_row]:=' and SALES_ORDER like ''%'+trim(Edit1.Text)+'%''';
  end;
end;

procedure Tfrm_Search.Button2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;
procedure Tfrm_Search.Button3Click(Sender: TObject);
begin
  Close;
end;

end.
