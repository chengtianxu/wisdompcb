unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, ComCtrls, Menus;

type
  TFrm_Search = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    SGrd: TStringGrid;
    StaticText2: TStaticText;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    dtpk1: TDateTimePicker;
    Label4: TLabel;
    dtpk2: TDateTimePicker;
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row: byte);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
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
  Edit1.Visible:=True;
  Edit1.Text:='';
  Button1.Enabled:=False;
  dtpk1.Visible:=False;
  Label4.Visible:=False;
  dtpk2.Visible:=False;
  case ListBox1.ItemIndex of
    0: ;
    1: ;
    2: ;
    3: ;
    4: ;
    5: ;
    6: ;
    7:
    begin
      Edit1.Visible:=False;
      Button1.Enabled:=True;
      Label1.Caption:='从';
      dtpk1.Visible:=True;
      Label4.Visible:=True;
      dtpk2.Visible:=True;
    end;
  end;
end;

procedure TFrm_Search.FormShow(Sender: TObject);
begin
  SGrd.Cells[0,0]:='条件名';
  SGrd.Cells[1,0]:='条件值';
  ListBox1.ItemIndex:=0;
  ListBox1Click(Sender);
end;

procedure TFrm_Search.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Search.Button1Click(Sender: TObject);
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
      SGrd.Cells[2,sgrid_row]:=' and Data0573.allocate_number like ''%'+trim(Edit1.Text)+'%''';
    1:
      SGrd.Cells[2,sgrid_row]:=' and Data0417.fasset_code like ''%'+trim(Edit1.Text)+'%''';
    2:
      SGrd.Cells[2,sgrid_row]:=' and Data0514.FASSET_TYPE like ''%'+trim(Edit1.Text)+'%''';
    3:
      SGrd.Cells[2,sgrid_row]:=' and Data0573.alloc_outfac like ''%'+trim(Edit1.Text)+'%''';
    4:
      SGrd.Cells[2,sgrid_row]:=' and Data0573.alloc_outdeptname like ''%'+trim(Edit1.Text)+'%''';
    5:
      SGrd.Cells[2,sgrid_row]:=' and Data0573.alloc_infac like ''%'+trim(Edit1.Text)+'%''';
    6:
      SGrd.Cells[2,sgrid_row]:=' and Data0573.alloc_indeptname like ''%'+trim(Edit1.Text)+'%''';
    7:
    begin
      SGrd.Cells[1,sgrid_row]:=Label1.Caption+DateTimeToStr(dtpk1.Date)+Label4.Caption+DateTimeToStr(dtpk1.Date);
      SGrd.Cells[2,sgrid_row]:=' and data0573.ent_date>='+
                               quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk1.Date))+ 'and data0573.ent_date<= '+
                               quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk2.Date+1));;
    end;
  end;
end;

procedure TFrm_Search.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  Button1.Enabled:=True;
end;

procedure TFrm_Search.Button2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_Search.N1Click(Sender: TObject);
var
  k:Byte;
begin
  if SGrd.RowCount>2 then
  begin
    for k := SGrd.Row to SGrd.RowCount-2 do
    begin
      SGrd.Rows[k].Text:=SGrd.Rows[k+1].Text;
      SGrd.RowCount:=SGrd.RowCount-1;
    end;
  end
  else
    SGrd.Rows[SGrd.Row].Clear;
end;

end.
