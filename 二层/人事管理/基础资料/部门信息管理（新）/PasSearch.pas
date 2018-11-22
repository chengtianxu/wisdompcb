unit PasSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TfrmSearch = class(TForm)
    GroupBox1: TGroupBox;
    lbList: TListBox;
    lbText: TLabel;
    edtCondition: TEdit;
    rgCondition: TRadioGroup;
    GroupBox2: TGroupBox;
    btnAdd: TBitBtn;
    btnClear: TBitBtn;
    btnConfirm: TBitBtn;
    btnCancel: TBitBtn;
    sgList: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure lbListClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure updateSg(sg_row:Byte);
  public
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

{$R *.dfm}

procedure TfrmSearch.lbListClick(Sender: TObject);
begin
  lbText.Caption:=lbList.Items[lbList.itemindex];
  edtCondition.SetFocus;
end;

procedure TfrmSearch.btnAddClick(Sender: TObject);
var
  i:Byte;
begin
  for i:=1 to sgList.RowCount-2 do
    if sgList.Cells[0,i]=lbList.Items[lbList.ItemIndex] then
    begin
      updateSg(i);
      edtCondition.Text:='';
      Exit;
    end;
  updateSg(sgList.RowCount-1);
  sgList.RowCount:=sgList.RowCount+1;
  edtCondition.Text:='';
end;

procedure TfrmSearch.updateSg(sg_row: Byte);
begin
  sgList.Cells[0,sg_row]:=lbList.Items[lbList.itemindex];
  if lbList.ItemIndex=0 then
  begin
    if rgCondition.ItemIndex=0 then
    begin
      sgList.Cells[1,sg_row]:=rgCondition.Items[rgCondition.itemindex] + Trim(edtCondition.Text);
      sgList.Cells[2,sg_row]:=' and departmentcode like ''%' + Trim(edtCondition.Text)+ '%''';
    end
    else
    begin
      sgList.Cells[1,sg_row]:=rgCondition.Items[rgCondition.itemindex] + Trim(edtCondition.Text);
      sgList.Cells[2,sg_row]:=' and departmentcode = '+ Trim(edtCondition.Text);
    end;
  end
  else
  begin
    if rgCondition.ItemIndex=0 then
    begin
      sgList.Cells[1,sg_row]:=rgCondition.Items[rgCondition.itemindex] + Trim(edtCondition.Text);
      sgList.Cells[2,sg_row]:=' and departmentname like ''%' + Trim(edtCondition.Text)+ '%''';
    end
    else
    begin
      sgList.Cells[1,sg_row]:=rgCondition.Items[rgCondition.itemindex] + Trim(edtCondition.Text);
      sgList.Cells[2,sg_row]:=' and departmentname = '+ Trim(edtCondition.Text);
    end;
  end;
end;

procedure TfrmSearch.btnClearClick(Sender: TObject);
var
  i,j:Integer;
begin
  for i:=1 to sgList.RowCount do
    for j:=0 to sgList.ColCount-1 do
    begin
      sgList.Cells[j,i]:='';
    end;
  sgList.RowCount:=2;
end;

procedure TfrmSearch.N1Click(Sender: TObject);
var
  i:Integer;
begin
  for i:=sgList.Row to sgList.ColCount do      //注意要从选定行开始
  begin
    sgList.Rows[i]:=sgList.Rows[i+1];    //把下一行的数据覆盖选定行
  end;
  sgList.RowCount:=sgList.RowCount-1;
end;

procedure TfrmSearch.FormShow(Sender: TObject);
begin
  rgCondition.ItemIndex:=0;
  lbList.ItemIndex:=0;
  edtCondition.SetFocus;
  sgList.Cells[0,0]:='条件名';
  sgList.Cells[1,0]:='条件值';
end;



end.
