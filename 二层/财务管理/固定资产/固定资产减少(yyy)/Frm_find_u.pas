unit Frm_find_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGrids, StdCtrls, ADODB, ActnList, Buttons,
  DBGridEh;

type

  TfldV = record
    sFld:string;
    fldValue:variant;
  end;

  TfldValue = array of TfldV;

  TFrm_find = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    CMb: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGridEh;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private

     afld:array[0..50] of string;
     b:boolean;

  public
     class function getStr(const Dt: TDataSet;sCpt:string;out isOk:boolean;sDtNm:string='';DefltFld:string='';DefltFldValue:string=''): TfldValue;
    
  end;

var
  Frm_find: TFrm_find;
function getFldV(P:TfldValue;sfld:string):variant;
implementation

{$R *.dfm}


class function TFrm_find.getStr(const Dt: TDataSet;sCpt: string;out isOk:boolean;sDtNm:string='';DefltFld:string='';DefltFldValue:string=''): TfldValue;
var i:integer;
    Evt:TNotifyEvent;
    w:integer;
begin
   result:=nil;
   isOk:=false;

   Frm_find:=TFrm_find.Create(nil);
   try
     Frm_find.b:=false;
     Frm_find.Caption:=sCpt;
     Frm_find.DataSource1.DataSet:=Dt;
     Frm_find.Cmb.Items.Clear;
     w:=Frm_find.DBGrid1.Canvas.TextWidth('W');
     for i:=0 to Dt.FieldCount-1 do
     begin
       if Dt.Fields[i].DataType=ftString then
         Frm_find.DBGrid1.Columns[i].Width:=w*Dt.Fields[i].Size div 2+2*w
       else if Dt.Fields[i].DataType=ftDateTime then
         Frm_find.DBGrid1.Columns[i].Width:=w*11
       else if Dt.Fields[i].DataType=ftBoolean then
         Frm_find.DBGrid1.Columns[i].Width:=w*3
       else
         Frm_find.DBGrid1.Columns[i].Width:=w*8;

       Frm_find.Cmb.Items.Add(Dt.Fields[i].DisplayLabel);
       Frm_find.afld[i]:=Dt.Fields[i].FullName;
       if (DefltFld<>'') and not Frm_find.b then
       begin
         if uppercase(DefltFld)=uppercase(Dt.Fields[i].FullName) then
         begin
           Frm_find.b:=true;
           Frm_find.Cmb.ItemIndex:=i;
           Evt:=Frm_find.edit1.OnChange;
           Frm_find.edit1.OnChange:=nil;
           Frm_find.edit1.Text:=DefltFldValue;
           Dt.Filter:=Dt.Fields[i].FullName+' like '''+DefltFldValue+'%''';
           Frm_find.edit1.OnChange:=Evt;
         end;
       end;
     end;

     Dt.Filtered:=true;
     if Frm_find.ShowModal=mrok then
     begin
       isOk:=true;
       setlength(result,Dt.FieldCount);
       for i:=0 to Dt.FieldCount-1 do
       begin
          result[i].sFld:=Dt.Fields[i].FullName;
          result[i].fldValue:=Dt.Fields[i].Value;
       end;
     end;
   finally
     Frm_find.free;
   end;
   Dt.Filter:='';
   Dt.Filtered:=false;
end;

procedure TFrm_find.DBGrid1DblClick(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
     ModalResult:=mrcancel
  else
    ModalResult:=mrok;
end;

procedure TFrm_find.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then  ModalResult:=mrok;
end;

procedure TFrm_find.Edit1Change(Sender: TObject);
begin
  if edit1.Text='' then
    DataSource1.DataSet.Filtered:=false
  else begin
    DataSource1.DataSet.Filtered:=false ;
    DataSource1.DataSet.Filter:=afld[CMb.itemindex]+' like '''+edit1.Text+'%''';
    DataSource1.DataSet.Filtered:=true;
  end;
end;


function getFldV(P:TfldValue;sfld:string):variant;
var i:integer;
begin
  result:=Unassigned;
  for i:=low(P) to high(p) do
  begin
    if UpperCase(p[i].sFld)=UpperCase(sfld) then
    begin
      if p[i].fldValue<>null then
        result:=p[i].fldValue ;
      break;
    end;
  end;
end;
procedure TFrm_find.Action1Execute(Sender: TObject);
begin
  close;
end;

procedure TFrm_find.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
   if (TDBGrideh(Sender).DataSource.DataSet.RecNo mod 2=0)  then
    TDBGrideh(Sender).Canvas.Brush.Color:=$00B1CDCB;
   TDBGrideh(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFrm_find.FormShow(Sender: TObject);
begin
  if b then
  begin
    edit1.SetFocus;
    sendmessage(edit1.Handle,WM_KEYDOWN,vk_right,0);
  end;
end;

end.
