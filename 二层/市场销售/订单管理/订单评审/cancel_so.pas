unit cancel_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo, pact_matter, main, pacted_list;

{$R *.dfm}

procedure TForm3.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption := '销售订单号'
else
 label1.Caption := '本厂编号';

edit1.SetFocus;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(dm.ado60_cancel.SQL.Text);
end;

procedure TForm3.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ado60_cancel.IsEmpty then
begin
form6:=tform6.Create(application);
dm.ado89.Close;
dm.ado89.DataSource:=dm.DataSource5;
dm.ado89.Open;

dm.ADO90.Close;
dm.ADO90.DataSource:=dm.DataSource5;
dm.ADO90.Open;

if form6.ShowModal=mrok then
 begin
  dm.ado60_cancel.Edit;
  dm.ado60_cancelauth_date.AsVariant:=null;
  dm.ado60_canceluser_ptr.AsVariant:=null;
  if dm.ado60_cancelquote_price.Value=1  then
   dm.ado60_cancelquote_price.Value:=0;

  if dm.ado60_cancelif_puthdate.Value=1 then
   dm.ado60_cancelsch_date.AsVariant := null;

  dm.ado60_cancel.Post;
  dm.ado60_cancel.Close;
  dm.ado60_cancel.Open;

 end;

dm.ado89.Close;
dm.ado89.DataSource:=dm.DataSource1;

dm.ADO90.Close;
dm.ADO90.DataSource:=dm.DataSource1;

form6.Free;
end;
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  if radiogroup1.ItemIndex=0 then
   dm.ado60_cancel.Filter := 'sales_order like '''+Trim(Edit1.Text)+'%'''
  else
   dm.ado60_cancel.Filter := 'Manu_part_number like ''%'+trim(edit1.text)+'%'''
 ELSE
  dm.ado60_cancel.FILTER:='';

end;

procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
if dm.ado60_cancel.IsEmpty then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;

end.
