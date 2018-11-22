unit sale_casepas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, Menus;

type
  TForm3 = class(TForm)
    Bevel1: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    DBEdit17: TDBEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DBEdit18: TDBEdit;
    Edit6: TEdit;
    DBCheckBox1: TDBCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBText2: TDBText;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    procedure DBEdit18KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit15Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo, note;

{$R *.dfm}

procedure TForm3.DBEdit18KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',(Sender as TdbEdit).Text)>0  //小数点不能重复
  then abort;
end;

procedure TForm3.DBEdit15Exit(Sender: TObject);
var
 ovsh_price,disc_single,tax_single:single;
begin
 if trim((Sender as TdbEdit).text)='' then (Sender as TdbEdit).Field.Value:=0;

  if dm.ADOD64tax_in_price.Value='N' then  //(价格中不含税)
    ovsh_price := dm.ADOD64ovsh_qty.Value*
                  dm.ADOD64part_price.Value*
                  (1-dm.adod64ovsh_discount.Value*0.01)  //溢装价款不含税
  else                       //(价格中含税)
    ovsh_price := dm.ADOD64ovsh_qty.Value*dm.ADOD64part_price.Value*
                 (1-dm.ADOD64ovsh_discount.Value*0.01)/
                 (1+dm.ADOD64TAX_2.Value*0.01);  //溢装价款不含税

  disc_single:=(strtocurr(edit1.Text)+ovsh_price)*dm.ADOD64discount.Value*0.01; //折扣

  tax_single:=(strtocurr(edit1.Text)+ovsh_price-disc_single)*dm.ADOD64TAX_2.Value*0.01;

  edit2.Text:=formatfloat('0.00',ovsh_price);
  edit4.Text:=formatfloat('0.00',disc_single);
  edit5.Text:=formatfloat('0.00',tax_single);
  edit6.Text:=formatfloat('0.00',strtocurr(edit1.Text)+ovsh_price-disc_single+tax_single);
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm3.N1Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='销售定单记事本:'+dm.ADoD64sales_order.Value;
  edit_note.BitBtn1.Enabled:=false;
  edit_note.Memo1.ReadOnly:=true;
  edit_note.Memo1.Color:=cl3dlight;
  edit_note.Button1.Visible:=false;
  edit_note.Button2.Visible:=false;
  edit_note.Button3.Visible:=true;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=60 and');
    sql.Add('file_pointer='+dm.ADoD64SO_PTR.AsString);
    open;
    if not isempty then
    for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm3.N2Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='装运指派记事本:'+dm.ADoD64sales_order.Value;
  edit_note.BitBtn1.Enabled:=false;
  edit_note.Memo1.ReadOnly:=true;
  edit_note.Memo1.Color:=cl3dlight;
  edit_note.Button1.Visible:=false;
  edit_note.Button2.Visible:=false;
  edit_note.Button3.Visible:=true;
  with dm.ADOquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=64 and file_pointer='+dm.ADod64rkey.AsString);
    open;
   if not isempty then
    for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

end.
