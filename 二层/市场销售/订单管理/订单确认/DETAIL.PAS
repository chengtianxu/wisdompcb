unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  ComCtrls;

type
  TForm8 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel1: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Button1: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBGrid1: TDBGrid;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    Label25: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit3: TDBEdit;
    DBText1: TDBText;
    Label4: TLabel;
    Memo1: TMemo;
    DBCheckBox1: TDBCheckBox;
    Edit2: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit24: TDBEdit;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Edit3: TEdit;
    Label7: TLabel;
    Label28: TLabel;
    DBEdit7: TDBEdit;
    DBEdit25: TDBEdit;
    Label29: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  end;

var
  Form8: TForm8;

implementation
uses damo, surcharge;
{$R *.dfm}
procedure TForm8.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm8.FormActivate(Sender: TObject);
var
 total,tax_amount:single;
begin
tax_amount:=0;
 with dm.ADOQuery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select * from data0062 where');
   sql.Add('so_ptr='+dm.ADOQuery3RKEY.AsString);
   active := true;
   while not Eof do   //查找工具费用
    begin
     if dm.ADOQuery3tax_in_price.Value='N' then //价格不含税
      if dm.ADOQuery2.FieldValues['tax_flag']='Y' then
       tax_amount:=tax_amount+strtocurr(floattostrf(
                              dm.ADOQuery2.FieldValues['amount']*
                              dm.ADOQuery3RUSH_CHARGE.Value*0.01,ffFixed,10,4))
      else
     else   //本身含税
      if dm.ADOQuery2.FieldValues['tax_flag']='Y' then
       tax_amount:=tax_amount+strtocurr(floattostrf(
                              dm.ADOQuery2.FieldValues['amount']*
                              dm.ADOQuery3RUSH_CHARGE.Value*0.01/
                           (1+dm.ADOQuery3RUSH_CHARGE.Value*0.01),ffFixed,10,4));
     Next;
    end;
  end;
edit2.Text:=formatfloat('0.0000',tax_amount);

if not dm.ADOQuery3.IsEmpty then
 begin
  if dm.ADOQuery3tax_in_price.Value='N' then
   begin
    total:=dbedit15.Field.Value*dbedit16.Field.Value;
    edit1.Text:=formatfloat('0.0000',total+dbedit19.Field.Value+
                                 (total*dbedit17.Field.Value*0.01)+
                                 tax_amount-
                                 (total*dbedit18.Field.Value*0.01));
   end
  else
   begin
    edit1.Text:=formatfloat('0.0000',dm.ADOQuery3PARTS_ORDERED.Value*
                                    dm.ADOQuery3PART_PRICE.Value+
                                    dm.ADOQuery3TOTAL_ADD_L_PRICE.Value-
          dm.ADOQuery3PARTS_ORDERED.Value*dm.ADOQuery3PART_PRICE.Value/
          (1+dm.ADOQuery3RUSH_CHARGE.Value*0.01)*dm.ADOQuery3DISCOUNT.Value*0.01
                      );
   end;
 end
else
 bitbtn1.Enabled:=false;
 Self.PageControl1.ActivePageIndex := 0;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
 try
  form9:=Tform9.Create(application);
  form9.ShowModal;
 finally
  form9.free;
 end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

end.
