unit shipped_meth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBText2: TDBText;
    DBEdit5: TDBEdit;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure save_note();
    procedure report_print();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
   prite:byte;     //保存之前打印=1反之=
   retn_quan:double;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  edit_notex: tstringlist;
implementation
uses damo, shipmeth_search, note, main, report_r,common;
{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
 try
  form_shipmethod:=tform_shipmethod.Create(application);
  if form_shipmethod.ShowModal=mrok then
   begin
    edit1.Text :=form_shipmethod.ADOQuery1.fieldbyname('description').AsString;
    edit1.Font.Color := clwindowtext;
    edit3.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_shipmethod.free;
 end;
end;

procedure TForm2.Edit1Enter(Sender: TObject);
begin
 edit1.Font.Color := clblue;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
 edit1.Font.Color := clwindowtext;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
 i:byte;
begin
 edit_notex:=tstringlist.Create;
 with dm.ADO2211 do
  begin
   active:=false;
   Parameters[2].Value := dm.ADO235rkey.Value;
   active:=true;
   if not isempty then
    for i:=1 to 4 do
     edit_notex.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
  end;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 edit_notex.Free;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ADO2211.Close;
 dm.ADO95.Close;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Memo1.Lines.Assign(edit_notex);
 if edit_note.ShowModal=mrok then
   edit_notex.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.save_note();
var
 i:byte;
begin
 if (not dm.ADO2211.IsEmpty) and (trim(edit_notex.Text)<>'') then
  begin //原记录有记事本
   dm.ADO2211.Edit;
   for i:=1 to edit_notex.Count do
    dm.ADO2211.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_notex.Strings[i-1];
    dm.ADO2211.Post;
  end
 else
  if (not dm.ADO2211.IsEmpty) and (trim(edit_notex.Text)='') then
   dm.ADO2211.Delete   //如果原记录有记事本但被删除了
  else
   if (dm.ADO2211.IsEmpty) and (trim(edit_notex.Text)<>'') then
    begin           //如果原记录没有记事本，但新增了记事本
     dm.ADO2211.Append;
     dm.ADO2211.FieldByName('file_pointer').AsString:=dm.ADO235.fieldbyname('rkey').AsString;
     dm.ADO2211.Fieldvalues['source_type']:=235;
     for i:=1 to edit_notex.Count do
      dm.ADO2211.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_notex.Strings[i-1];
      dm.ADO2211.Post;
    end;
end;


procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 save_note();                     //更新11记事本
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 dm.ADO235.Edit;                            //更新235
 dm.ADO235quan_returned.Value :=dm.ADO235quan_returned.Value+dm.ADO235quan_to_ship.Value;
 dm.ADO235QUAN_RETN.Value:=dm.ADO235QUAN_RETN.Value+dm.ADO235quan_to_ship.Value;
                                            //上面更新72
 retn_quan := dm.ADO235quan_to_ship.Value;
 dm.ADO235quan_to_ship.Value := 0;

 dm.ADO235.Post;         //更新235
 self.prite:=1;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 dm.ADO95.Open;
 with dm.ADO95 do           //日志记录
  begin
   append;
   fieldvalues['tran_tp'] := 33;
   fieldvalues['srce_ptr'] := dm.ADO235rkey.Value;
   fieldbyname('user_ptr').AsString := rkey73;
   FieldValues['tran_by'] := strtoint(form1.user_ptr.Caption);
   fieldvalues['quantity'] := retn_quan;
   Fieldvalues['tran_date'] := form1.sys_longdate;
   FieldByName('shipping_method').AsString := edit1.Text;    //装运方法
   FieldByName('reference_number').AsString := edit3.Text;   //barcode
   post;
  end;                                 //更新95
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 dm.ADO210.Close;
 dm.ADO210.Open;
 with dm.ADO210 do  //更新210 //2002.10.31修改成210总是新增一条记录
  begin
   append;
   dm.ADO210D0235_PTR.Value := DM.ADO235rkey.Value;
   fieldvalues['po_link_ptr'] := dm.ado235d0072_ptr.Value; //72.rkey
   fieldvalues['quantity'] := retn_quan;
   fieldvalues['tdate'] := dm.ADO95.FieldValues['tran_date'];
   dm.ADO210empl_ptr.Value := dm.ADO95.FieldValues['tran_by'];
   dm.ADO210type.Value:=1;
   post;
  end;//060715修改增加记录准备做借项备忘
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if messagedlg('是否打印装箱单?',mtconfirmation,[mbyes,mbno],0)=mryes then
  form2.report_print();
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 ModalResult:=mrok;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
 self.prite:=0;      //保存之前打印
 report_print();
end;

procedure TForm2.report_print();
var
 i:byte;
begin
 try
  dm.aq0493.Open;
  form_report:=tform_report.Create(application);
  for i:=1 to edit_notex.Count do
  form_report.QRMemo1.Lines.Add(edit_notex.Strings[i-1]);
  form_report.QRLabel12.Caption := edit1.Text;  //装运方法
  form_report.QRLabel13.Caption := edit3.Text;       //参考号码
  form_report.QRMemo2.Lines.Add(dm.ADO235BILLING_ADDRESS_1.Value);
   if self.prite=1 then //保存之后的打印
    begin
     form_report.QRLabel19.Caption := formatfloat('0.000',self.retn_quan);  //退货数量
     form_report.QRLabel29.Caption := formatfloat('0.000',self.retn_quan*dm.ADO235UNIT_PRICE.Value);    //退货金额按采购单位计算
    end
   else                   //保存之前的打印
    begin
     form_report.QRLabel19.Caption := formatfloat('0.000',dm.ADO235quan_to_ship.Value);//退货数量
     form_report.QRLabel29.Caption := formatfloat('0.000',dm.ADO235quan_to_ship.Value*dm.ADO235UNIT_PRICE.Value);
    end;
  form_report.QuickRep1.Preview;
 finally
  form_report.free;
 end;
end; 

end.
