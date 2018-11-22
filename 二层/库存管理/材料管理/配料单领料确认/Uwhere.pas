unit Uwhere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons;

type
  TForm_where = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ListBox1: TListBox;
    StringGrid1: TStringGrid;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    BitBtn7: TBitBtn;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_where: TForm_where;

implementation
 uses ConstVar,Pick_Item_Single,DB,common , demo;
{$R *.dfm}

procedure TForm_where.FormCreate(Sender: TObject);
var i :Integer;
begin
 v_Field_List_CN:=VarArrayOf(['配料单号','领料确认人员']);
 v_Field_List_EN:=VarArrayOf(['dbo.data0492.CUT_NO','employeemsg.chinesename']);
 for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
 listbox1.Items.Add(v_Field_List_CN[i]);
 StringGrid1.Cells[0,0]:='条件名';
 StringGrid1.Cells[1,0]:='条件值';
 ListBox1.ItemIndex:=0;
 DateTimePicker1.Date:=date-2;
 DateTimePicker2.Date:=date;

 end;

procedure TForm_where.ListBox1Click(Sender: TObject);
begin
 edit1.text:='';
 Label6.Caption := listbox1.Items[listbox1.ItemIndex];
end;

procedure TForm_where.Button3Click(Sender: TObject);
var
  i:Byte;
begin
 if Trim(Edit1.Text)='' then Exit;
 for i:=1 to StringGrid1.RowCount-2 do
 if StringGrid1.Cells[0,i]=ListBox1.Items[ListBox1.ItemIndex] then Exit;
 StringGrid1.Cells[0,StringGrid1.RowCount-1]:=ListBox1.Items[ListBox1.Itemindex];
 StringGrid1.Cells[1,StringGrid1.RowCount-1]:=Edit1.Text;
 StringGrid1.Cells[2,StringGrid1.RowCount-1]:='and '+ v_Field_List_EN[ListBox1.Itemindex]+' like''%'+edit1.Text+'%''';
 StringGrid1.RowCount:=StringGrid1.RowCount+1;

end;

procedure TForm_where.Button4Click(Sender: TObject);
var
  i:Byte;
begin
 if StringGrid1.RowCount<=2 then Exit;
 for I:=StringGrid1.Row to StringGrid1.RowCount-2 do StringGrid1.Rows[i].Text:=StringGrid1.Rows[i+1].Text;
 StringGrid1.RowCount:=StringGrid1.RowCount-1;
end;

procedure TForm_where.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    if ListBox1.ItemIndex=0 then
    begin
     InputVar.Fields := 'CUT_NO/配料单号/200,chinesename/领料人姓名/250';
     InputVar.Sqlstr :='SELECT     dbo.data0492.rkey, dbo.data0492.CUT_NO,dbo.data0492.ConfMan,'+
     ' employeemsg.chinesename, employeemsg.employeecode FROM dbo.data0492 LEFT  JOIN '+
     ' employeemsg ON dbo.data0492.ConfMan = employeemsg.employeecode  ORDER BY rkey DESC' ;
     inputvar.KeyField := 'rkey';
     end;
    if ListBox1.ItemIndex=1 then
    begin
     InputVar.Fields := 'employeecode/领料人员工号/200,chinesename/领料人员姓名/250';
     InputVar.Sqlstr :='SELECT rkey,chinesename,employeecode FROM employeemsg ' ;
     inputvar.KeyField := 'rkey';
     end;

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);

    if frmPick_Item_Single.ShowModal=mrok then
    begin
     case ListBox1.ItemIndex of
      0:
      begin
       Edit1.Text:= frmPick_Item_Single.adsPick.fieldbyname('CUT_NO').AsString;
      end;
      1:
      begin
       Edit1.Text:= frmPick_Item_Single.adsPick.fieldbyname('chinesename').AsString;
      end;


     end;
     
    end;
   finally
     end;
end;
procedure TForm_where.FormShow(Sender: TObject);
begin
 Panel1.Visible:=False;
end;

end.
