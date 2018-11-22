unit Main8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  ADODB, Menus;

type
  TFrmMain8 = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Label6: TLabel;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    empl_ptr: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    StringGrid1: TStringGrid;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    RadioGroup1: TRadioGroup;
    ADOData0022: TADOStoredProc;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure BitBtn5Enter(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure N7Click(Sender: TObject);
    procedure BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain8: TFrmMain8;

implementation

uses warehouse_search,Barcode_serach,mainmenu, AssigQty3;

{$R *.dfm}

procedure TFrmMain8.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain8.Edit2Exit(Sender: TObject);
begin
   if FrmMain8.ActiveControl =bitbtn4 then exit;
   FrmWhouse.edit1.Text := edit2.Text;
   IF not FrmWhouse.Adoquery1.Eof then
   Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
   End else
   begin
    messagedlg('厂房代号无效！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    edit2.SelectAll ;
   end;
   with FrmBCSearch.ADOQuery1 do
   begin
     close;
     parameters.ParamByName('@vptr').value:=FrmWhouse.AdoQuery1.fieldbyname('rkey').asstring;
     open;
   end;
   edit3.Enabled :=true;
   bitbtn5.Enabled :=true;
end;

procedure TFrmMain8.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   FrmWhouse.edit1.Text := edit2.Text;
   IF FrmWhouse.ShowModal=mrok then
   Begin
     edit2.text:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_code').asstring;
     label3.Caption:=FrmWhouse.AdoQuery1.fieldbyname('warehouse_name').asstring;
     with FrmBCSearch.ADOQuery1 do
     begin
       close;
       parameters.ParamByName('@vptr').value:=FrmWhouse.AdoQuery1.fieldbyname('rkey').asstring;
       open;
     end;
   End;
   edit3.Enabled :=true;
   bitbtn5.Enabled :=true;
end;

procedure TFrmMain8.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TFrmWhouse, FrmWhouse);
  Application.CreateForm(TFrmBCSearch, FrmBCSearch);
  with stringgrid1 do
  begin
    cells[0,0]:='材料代号';
    cells[1,0]:='材料名称';
    cells[2,0]:='单位';
    cells[3,0]:='Barcode号';
    cells[4,0]:='库存数量';
    cells[5,0]:='有效期';
    cells[6,0]:='发放数量';
  end;
end;

procedure TFrmMain8.Edit3Exit(Sender: TObject);
var i:integer;
  vexisted:string;
begin
  if trim(edit3.Text)='' then exit;
  with Adodata0022 do
  begin
    close;
    if Radiogroup1.ItemIndex =0 then
      Parameters.ParamByName('@vptr').value:=copy(trim(edit3.Text),2,length(trim(edit3.Text))-2)
    else
      Parameters.ParamByName('@vptr').value:=trim(edit3.Text);
    open;
  end;
  if Adodata0022.RecordCount =0 then
  begin
    messagedlg('该BARCODE号无效！',mtinformation,[mbok],0);
    exit;
  end;
  if Adodata0022.fieldbyname('whouse_ptr').AsInteger<>FrmWhouse.AdoQuery1.fieldbyname('rkey').asinteger then
  begin
    messagedlg('该BARCODE号不在'+edit2.text+'！',mtinformation,[mbok],0);
    exit;
  end;
  Application.CreateForm(TFrmAssigQty3, FrmAssigQty3);
  FrmAssigQty3.Edit1.text :=Adodata0022.fieldbyname('inv_part_number').asstring;
  FrmAssigQty3.Edit2.text :=Adodata0022.fieldbyname('expire_date').asstring;
  FrmAssigQty3.Edit3.text :=Adodata0022.fieldbyname('quan_on_hand').asstring;
  FrmAssigQty3.Edit4.text :=Adodata0022.fieldbyname('quan_on_hand').asstring;
  FrmAssigQty3.Edit5.text :=Adodata0022.fieldbyname('barcode_id').asstring;
  if FrmAssigQty3.showmodal=mrok then
  begin
    vexisted:='';
    for i:=1 to stringgrid1.rowcount-1 do
      if stringgrid1.Cells[3,i]=Adodata0022.fieldbyname('barcode_id').asstring
        then begin
          vexisted:='Y';
          break;
        end;

    if vexisted='' then
    with Stringgrid1 do
    begin
      RowCount :=RowCount +1;
      Cells[0,rowcount-2]:=Adodata0022.fieldbyname('inv_part_number').asstring;
      Cells[1,rowcount-2]:=Adodata0022.fieldbyname('inv_part_description').asstring;
      Cells[2,rowcount-2]:=Adodata0022.fieldbyname('unit_code').asstring;
      Cells[3,rowcount-2]:=Adodata0022.fieldbyname('barcode_id').asstring;
      Cells[4,rowcount-2]:=Adodata0022.fieldbyname('quan_on_hand').asstring;
      Cells[5,rowcount-2]:=Adodata0022.fieldbyname('expire_date').asstring;
      Cells[6,rowcount-2]:=Frmassigqty3.Edit4.text;
      stringgrid1.Rows[stringgrid1.RowCount -1].Text :='';
    end else
      stringgrid1.Cells[6,i]:=floattostr(strtofloat(stringgrid1.Cells[6,i])+strtofloat(Frmassigqty3.Edit4.text));

    Adodata0022.Edit ;
    Adodata0022.fieldbyname('quan_on_hand').asfloat:=Adodata0022.fieldbyname('quan_on_hand').asfloat
                                                      -strtofloat(FrmAssigqty3.edit4.text);
    Adodata0022.fieldbyname('quan_in_insp').asfloat:=Adodata0022.fieldbyname('quan_in_insp').asfloat
                                                      +strtofloat(FrmAssigqty3.edit4.text);
    Adodata0022.Post;
  end;
  FrmAssigQty3.free;
  edit2.Enabled :=false;
  bitbtn4.Enabled :=false;
  edit3.Text :='';
  edit3.SetFocus ;
end;

procedure TFrmMain8.Edit3Enter(Sender: TObject);
begin
  if trim(edit2.Text)='' then
  begin
    messagedlg('请输入厂房代号！',mtinformation,[mbok],0);
    exit;
  end;
end;

procedure TFrmMain8.BitBtn5Enter(Sender: TObject);
begin
  if trim(edit2.Text)='' then
  begin
    messagedlg('请输入厂房代号！',mtinformation,[mbok],0);
    exit;
  end;
end;

procedure TFrmMain8.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then bitbtn5.SetFocus ;
end;

procedure TFrmMain8.N7Click(Sender: TObject);
begin
  with Adodata0022 do
  begin
    close;
    parameters.ParamByName('@vptr').value:=Stringgrid1.Cells[3,stringgrid1.row];
    open;
  end;
  Application.CreateForm(TFrmAssigQty3, FrmAssigQty3);
  FrmAssigQty3.label3.Caption :='发出数量';
  FrmAssigQty3.label4.Caption :='退回数量';
  FrmAssigQty3.Edit1.text :=Adodata0022.fieldbyname('inv_part_number').asstring;
  FrmAssigQty3.Edit2.text :=Adodata0022.fieldbyname('expire_date').asstring;
  FrmAssigQty3.Edit3.text :=Stringgrid1.Cells[6,stringgrid1.row];
  FrmAssigQty3.Edit4.text :='0';
  FrmAssigQty3.Edit5.text :=Adodata0022.fieldbyname('barcode_id').asstring;
  if FrmAssigQty3.showmodal=mrok then
  begin
    Stringgrid1.Cells[6,stringgrid1.row]:=floattostr(strtofloat(Stringgrid1.Cells[6,stringgrid1.row])-strtofloat(Frmassigqty3.Edit4.text));

    Adodata0022.Edit ;
    Adodata0022.fieldbyname('quan_on_hand').asfloat:=Adodata0022.fieldbyname('quan_on_hand').asfloat
                                                      +strtofloat(FrmAssigqty3.edit4.text);
    Adodata0022.fieldbyname('quan_in_insp').asfloat:=Adodata0022.fieldbyname('quan_in_insp').asfloat
                                                      -strtofloat(FrmAssigqty3.edit4.text);
    Adodata0022.Post;
  end;
end;

procedure TFrmMain8.BitBtn5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
    vexisted:string;
begin
  if FrmBCSearch.showmodal<>mrok then
  begin
    exit;
  end;
  with Adodata0022 do
  begin
    close;
    parameters.ParamByName('@vptr').value:=FrmBCSearch.Adoquery1.fieldbyname('barcode_id').asstring;
    open;
  end;
  Application.CreateForm(TFrmAssigQty3, FrmAssigQty3);
  FrmAssigQty3.Edit1.text :=Adodata0022.fieldbyname('inv_part_number').asstring;
  FrmAssigQty3.Edit2.text :=Adodata0022.fieldbyname('expire_date').asstring;
  FrmAssigQty3.Edit3.text :=Adodata0022.fieldbyname('quan_on_hand').asstring;
  FrmAssigQty3.Edit4.text :=Adodata0022.fieldbyname('quan_on_hand').asstring;
  FrmAssigQty3.Edit5.text :=Adodata0022.fieldbyname('barcode_id').asstring;
  if FrmAssigQty3.showmodal=mrok then
  begin
    vexisted:='';
    for i:=1 to stringgrid1.rowcount-1 do
      if stringgrid1.Cells[3,i]=Adodata0022.fieldbyname('barcode_id').asstring
        then begin
          vexisted:='Y';
          break;
        end;

    if vexisted='' then
    with Stringgrid1 do
    begin
      RowCount :=RowCount +1;
      Cells[0,rowcount-2]:=Adodata0022.fieldbyname('inv_part_number').asstring;
      Cells[1,rowcount-2]:=Adodata0022.fieldbyname('inv_part_description').asstring;
      Cells[2,rowcount-2]:=Adodata0022.fieldbyname('unit_code').asstring;
      Cells[3,rowcount-2]:=Adodata0022.fieldbyname('barcode_id').asstring;
      Cells[4,rowcount-2]:=Adodata0022.fieldbyname('quan_on_hand').asstring;
      Cells[5,rowcount-2]:=Adodata0022.fieldbyname('expire_date').asstring;
      Cells[6,rowcount-2]:=Frmassigqty3.Edit4.text;
      stringgrid1.Rows[stringgrid1.RowCount -1].Text :='';
    end else
      stringgrid1.Cells[6,i]:=floattostr(strtofloat(stringgrid1.Cells[6,i])+strtofloat(Frmassigqty3.Edit4.text));

    Adodata0022.Edit ;
    Adodata0022.fieldbyname('quan_on_hand').asfloat:=Adodata0022.fieldbyname('quan_on_hand').asfloat
                                                      -strtofloat(FrmAssigqty3.edit4.text);
    Adodata0022.fieldbyname('quan_in_insp').asfloat:=Adodata0022.fieldbyname('quan_in_insp').asfloat
                                                      +strtofloat(FrmAssigqty3.edit4.text);
    Adodata0022.Post;

  end;
  FrmAssigQty3.free;
  edit2.Enabled :=false;
  bitbtn4.Enabled :=false;
  edit3.Text :='';
  edit3.SetFocus ;
end;

end.
