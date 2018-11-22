unit term;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, ComCtrls, Menus;

type
  Tform_condition = class(TForm)
    btn_1: TButton;
    txt1: TStaticText;
    lb_11: TLabel;
    dtpk1: TDateTimePicker;
    lb_12: TLabel;
    btn_11: TButton;
    btn_12: TButton;
    dtpk2: TDateTimePicker;
    sgrid1: TStringGrid;
    grb_1: TGroupBox;
    label8: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    bbt_11: TBitBtn;
    lst2: TListBox;
    txt2: TStaticText;
    pm_1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btn_12Click(Sender: TObject);
    procedure btn_11Click(Sender: TObject);
    procedure lst2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte);
    procedure sgrid1Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure pm_1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_condition: Tform_condition;

implementation

uses damo;

{$R *.dfm}

procedure Tform_condition.FormShow(Sender: TObject);
begin
  if Dm.TimeTag = 0 then
  begin
    dtpk1.Date := Now - 3;
    dtpk2.Date := now;
  end;
  if Dm.TimeTag = 1 then
  begin
    dtpk1.Date := DM.time1;
    dtpk2.Date := DM.time2;
  end;
end;

procedure Tform_condition.btn_12Click(Sender: TObject);
begin
  DM.time1 := dtpk1.Date;
  DM.time2 := dtpk2.Date;
  DM.TimeTag := 1;
  DM.tt := 1;
end;

procedure Tform_condition.btn_11Click(Sender: TObject);
begin
  DM.tt := 0;
  Close();
end;

procedure Tform_condition.lst2Click(Sender: TObject);
begin
  label8.Caption:=lst2.Items[lst2.itemindex];
  edit3.Text := '';
  edit3.Visible := true;
  button3.Enabled := false;
  bbt_11.Visible := false;
end;

procedure TForm_condition.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row] := lst2.Items[lst2.itemindex];
 sgrid1.Cells[1,sgrid_row] := edit3.Text;
 case lst2.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and Data0085.TNUMBER LIKE ''%'+edit3.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid_row]:='and data0085.REF_PART_NO LIKE ''%'+edit3.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid_row]:='and Data0085.CUST_PART_NO LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0085.CUST_NAME LIKE ''%'+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and data0008.PROD_CODE = '''+edit3.Text+'''';
 end;
end;

procedure Tform_condition.Button3Click(Sender: TObject);
var
 i: byte;
begin
    for i:=1 to sgrid1.RowCount-2 do
    begin
      if sgrid1.Cells[0,i]=lst2.Items[lst2.itemindex]  then
      begin
        self.update_sgrid(i);
        exit;
      end;
    end;

    sgrid1.Cells[0,sgrid1.RowCount-1]:=lst2.Items[lst2.itemindex];

    case lst2.ItemIndex of
      0:
      begin
        sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
        sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0085.TNUMBER LIKE ''%'+edit3.Text+'%''';

      end;
      1:
      begin
        sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
        sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0085.REF_PART_NO LIKE ''%'+edit3.Text+'%''';

      end;
      2:
      begin
        sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
        sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0085.CUST_PART_NO LIKE ''%'+edit3.Text+'%''';

      end;

      3:
      begin
        sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
        sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0085.CUST_NAME LIKE ''%'+edit3.Text+'%''';

      end;

      4:
      begin
        sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
        sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.Cust_CODE = '''+edit3.Text+'''';

      end;
    end;
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure Tform_condition.sgrid1Click(Sender: TObject);
begin
  if button3.Enabled then button3.OnClick(sender);
end;

procedure Tform_condition.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit3.Text)<>'' then
    button3.Enabled:=true
  else
    button3.Enabled:=false;
end;

procedure Tform_condition.sgrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if row<>0 then SGrid1.Row:=row;
 end;
end;

procedure Tform_condition.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure Tform_condition.pm_1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true; 
end;

procedure Tform_condition.FormCreate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
end;

end.
