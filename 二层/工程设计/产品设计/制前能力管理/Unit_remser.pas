unit Unit_remser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Buttons, Grids;

type
  TForm_remser = class(TForm)
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    StaticText4: TStaticText;
    ListBox2: TListBox;
    BitBtn10: TBitBtn;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row:byte);
  public
    { Public declarations }
  end;

var
  Form_remser: TForm_remser;

implementation
uses uDM,uMain, DEPT_Main;

{$R *.dfm}
procedure tform_remser.update_sgrid(sgrid_row :byte);
begin
  case listbox2.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and FA0738.FA_NUM LIKE ''%'+trim(edit2.Text)+'%''';
 1:
  sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
 2:
  sgrid1.Cells[2,sgrid_row]:='and Data0010.CUSTOMER_NAME LIKE''%'+trim(edit2.Text)+'%''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and FA0738.CreateDate >='''+datetostr(dtpk1.date)+
                            ''' and FA0738.CreateDate <='''+datetostr(dtpk2.date+1)+'''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and data0005.EMPLOYEE_NAME LIKE ''%'+trim(edit2.Text)+'%''';
 end;
end;

procedure TForm_remser.BitBtn6Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_remser.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_remser.BitBtn5Click(Sender: TObject);
 var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TForm_remser.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;

end;

procedure TForm_remser.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 bitbtn4.Enabled:=false
 else
  bitbtn4.Enabled:=true;
end;

procedure TForm_remser.sgrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if (row>0)and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
 end;
end;

procedure TForm_remser.BitBtn10Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
     (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
   begin
     if listbox2.ItemIndex=3 then
       sgrid1.Cells[1,i]:='从'+datetostr(dtpk1.Date)+'到'+datetostr(dtpk2.Date)
    else
      sgrid1.Cells[1,i]:=edit2.Text;
    update_sgrid(i);
    exit;
   end
 else
  if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
     (sgrid1.Cells[1,i]=listbox2.Items[listbox2.ItemIndex]) then exit;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
  if listbox2.ItemIndex=3 then
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.Date)+'到'+datetostr(dtpk2.Date)
  else
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edit2.Text;

  case listbox2.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and FA0738.FA_NUM LIKE ''%'+trim(edit2.Text)+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0010.CUSTOMER_NAME LIKE ''%'+trim(edit2.Text)+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and FA0738.CreateDate >='''+datetostr(dtpk1.date)+
                            ''' and FA0738.CreateDate <='''+datetostr(dtpk2.date+1)+'''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0005.EMPLOYEE_NAME LIKE ''%'+trim(edit2.Text)+'%''';


 end;

 sgrid1.RowCount:=sgrid1.RowCount+1;


end;

procedure TForm_remser.BitBtn3Click(Sender: TObject);
var
 i:byte;
begin
if sgrid1.RowCount=2 then
  begin
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0) ;
   listbox2.SetFocus;
  end
else
 begin
  with dm.ADO0738 do
   begin
    close;
    dm.ADO0738.CommandText:=main.sqltext;
    for i:=1 to sgrid1.RowCount-2 do
    dm.ADO0738.CommandText:=dm.ADO0738.CommandText+#32+sgrid1.Cells[2,i];
    open;
   end;
  self.Close; 
 end;
end;

procedure TForm_remser.ListBox2Click(Sender: TObject);
begin
  label1.Visible:=true;
  label1.Caption:=listbox2.Items[listbox2.itemindex];
  label2.Visible:=false;
  label3.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
  edit2.Text:='';
  edit2.Visible:=true;
  bitbtn10.Enabled:=false;
case listbox2.ItemIndex of
 0,1,2,4: edit2.SetFocus;
 3:
  begin
  bitbtn10.Enabled:=true;
  label1.Visible:=false;
  label3.Visible:=true;
  label2.Visible:=true;
  dtpk1.Visible:=true;
  dtpk2.Visible:=true;
  edit2.Visible:=false;
  dtpk1.SetFocus;
  end;
 end;
end;

procedure TForm_remser.FormCreate(Sender: TObject);
begin
  listbox2.Selected[0]:=true;
  label1.Visible:=true;
  label2.Visible:=false;
  label3.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
  edit2.Text:='';
  edit2.Visible:=true;
  bitbtn4.Enabled:=false;
  bitbtn10.Enabled:=false ;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  dtpk2.Date:=Now;
  dtpk1.Date:=dtpk2.Date-5;
end;

procedure TForm_remser.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if listbox2.ItemIndex in [3] then
 if not (key in ['0'..'9',#8,#13]) then abort;

end;

procedure TForm_remser.Edit2Change(Sender: TObject);
begin
 if trim(edit2.Text)<>'' then bitbtn10.Enabled:=true
 else bitbtn10.Enabled:=false;
end;

procedure TForm_remser.sgrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

end.
