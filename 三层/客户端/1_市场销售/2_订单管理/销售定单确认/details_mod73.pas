unit details_mod73;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Data.DB,
  Datasnap.DBClient,uBaseEditFrm;

type
  TForm_details = class(TfrmBaseEdit)
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    Label24: TLabel;
    Label25: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label7: TLabel;
    Label28: TLabel;
    Label29: TLabel;
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
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Edit2: TEdit;
    DBEdit24: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit25: TDBEdit;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Memo1: TMemo;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DBEdit26: TDBEdit;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ado89: TClientDataSet;
    ads360: TClientDataSet;
    Data89: TDataSource;
    Data360: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
  rkey1:Integer;
  procedure GetData(rkey:Integer);

    { Public declarations }
  end;

var
  Form_details: TForm_details;

implementation

{$R *.dfm}
uses uCommFunc, Umost;

{ TForm_details }



{ TForm_details }



{ TForm_details }

procedure TForm_details.BitBtn1Click(Sender: TObject);
begin
 try
  cost_mod73:=tcost_mod73.Create(application);
  cost_mod73.GetData;
  cost_mod73.getdata61(rkey1);
  cost_mod73.ShowModal;
  finally
  cost_mod73.free;
 end;
end;

procedure TForm_details.GetData(rkey: Integer);
var sql89,sql360,sql60,sql62, sql70:string;
    total,tax_amount:single;
begin
 rkey1:=rkey;
 sql89:=ado89.CommandText+' data0089.cust_part_ptr= '+intToStr(rkey)+' order by data0089.rkey ';
 sql360:=ads360.CommandText+IntToStr(rkey);
 sql60:='SELECT  tax_in_price,RUSH_CHARGE FROM Data0060 WHERE RKEY= '+IntToStr(rkey);
 sql62:='select * from data0062 where so_ptr= '+IntToStr(rkey);
 sql70:=ClientDataSet1.CommandText+' WHERE  data0060.rkey= '+IntToStr(rkey);
 gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([sql70,sql62,sql60,sql89,sql360]),[ClientDataSet1,ClientDataSet2,ClientDataSet3,ado89,ads360]);
 while not ClientDataSet2.Eof do
 begin
  if ClientDataSet3.FieldValues['tax_in_price']='N' then //价格不含税
   if ClientDataSet2.FieldValues['tax_flag']='Y' then
      tax_amount:=tax_amount+strtocurr(floattostrf(
                              ClientDataSet2.FieldValues['amount']*
                              ClientDataSet3.FieldValues['RUSH_CHARGE']*0.01,ffFixed,10,4))
   else
  else   //本身含税
      if ClientDataSet2.FieldValues['tax_flag']='Y' then
       tax_amount:=tax_amount+strtocurr(floattostrf(
                              ClientDataSet2.FieldValues['amount']*
                              ClientDataSet3.FieldValues['RUSH_CHARGE']*0.01/
                           (1+ClientDataSet3.FieldValues['RUSH_CHARGE']*0.01),ffFixed,10,4));
     Next;
 end;
  edit2.Text:=formatfloat('0.0000',tax_amount);
  if not ClientDataSet3.IsEmpty then
 begin
  if ClientDataSet3.FieldValues['tax_in_price']='N' then
   begin
    total:=dbedit15.Field.Value*dbedit16.Field.Value;
    edit1.Text:=formatfloat('0.0000',total+dbedit19.Field.Value+
                                 (total*dbedit17.Field.Value*0.01)+
                                 tax_amount-
                                 (total*dbedit18.Field.Value*0.01));
   end
  else
  begin
   edit1.Text:=formatfloat('0.0000',ClientDataSet3.FieldValues['PARTS_ORDERED']*
                                    ClientDataSet3.FieldValues['PART_PRICE']+
                                    ClientDataSet3.FieldValues['TOTAL_ADD_L_PRICE']-
         ClientDataSet3.FieldValues['PARTS_ORDERED']*ClientDataSet3.FieldValues['PART_PRICE']/
         (1+ClientDataSet3.FieldValues['RUSH_CHARGE']*0.01)*ClientDataSet3.FieldValues['DISCOUNT']*0.01
                      );
  end;
 end
else
 bitbtn1.Enabled:=false;
 Self.PageControl1.ActivePageIndex := 0;

end;

end.
