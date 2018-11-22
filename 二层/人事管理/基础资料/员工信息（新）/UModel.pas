unit UModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, DB, ADODB,common,
  Menus,Mainfrm;

type
  TFrmModel = class(TForm)
    pnl1: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl2: TPanel;
    dbgrdhDetail: TDBGridEh;
    pnl5: TPanel;
    pnl6: TPanel;
    btn1: TBitBtn;
    btnExcel: TBitBtn;
    btnDel: TBitBtn;
    dbgrdhModel: TDBGridEh;
    lbl1: TLabel;
    edt_ModelName: TEdit;
    lbl2: TLabel;
    edt_Field: TEdit;
    btnGetField: TBitBtn;
    btnAdd: TBitBtn;
    btnDel2: TBitBtn;
    pnl7: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    ds1: TDataSource;
    qryModel: TADOQuery;
    pmField: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDel2Click(Sender: TObject);
    procedure btnGetFieldClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure item_click(sender: Tobject);

  public
    { Public declarations }
  end;

var
  FrmModel: TFrmModel;

implementation
          uses UDM;
{$R *.dfm}

procedure TFrmModel.item_click(sender: Tobject);
begin

  //if (sender as Tmenuitem).Checked  then
   self.edt_Field.Text:=(sender as  Tmenuitem).Caption;

end;




procedure TFrmModel.FormCreate(Sender: TObject);
begin
    if not qryModel.Active then qryModel.Open;
end;

procedure TFrmModel.btnDelClick(Sender: TObject);
begin
 if  self.qryModel.recordcount <1 then  exit;
 
  if messagedlg('确定删除此记录吗?',mtWarning ,[mbYes,mbno],1)=mrno	then exit;
 with fdm.qrytemp do
 begin
   sql.Clear;
   sql.Text:='delete from  employeemsg_rpt_model where model_name='''+qryModel.fieldbyName('model_Name').value+'''    ';
   execsql;
 end;
 qrymodel.requery;


end;

procedure TFrmModel.btn1Click(Sender: TObject);
begin
 // ModalResult:=mrOk;
// self.Close;
end;

procedure TFrmModel.btnSaveClick(Sender: TObject);

var
 i : integer ;
 ssql : string;
begin

 if  trim(self.edt_ModelName.text)=''  then
   begin
     showmessage('请先输入模版名称！！');
     edt_ModelName.SetFocus;
     exit;
   end;


 if   dbgrdhModel.Columns.Count<4 then
    begin
     ShowMessage('模板列不能小于'+inttostr(FrmMain.dbgrdhDetail.FrozenCols)+'');
     exit;
    end;

    
  for i:=0  to dbgrdhModel.columns.Count-1 do
   begin

      ssql := 'insert into employeemsg_rpt_model values('''+trim(edt_ModelName.text)+''','''+dbgrdhmodel.columns[i].title.caption+''', '+inttostr(i)+' ) ' ;
     if   common.ExecSql(fdm.qrytemp, ssql) then
      begin
            self.qryModel.requery;
      end;
   end;

 
        


end;

procedure TFrmModel.btnAddClick(Sender: TObject);
var
  i: integer;
begin
    if  trim(self.edt_field.text)=''  then
   begin
     showmessage('请先选择项目名称！！');
     edt_field.SetFocus;
     exit;
   end;

    for i:=0 to  dbgrdhModel.Columns.Count-1 do
      begin
      if  trim(edt_field.text)= dbgrdhModel.Columns[i].Title.caption then
       begin
         showmessage('已添加'''+trim(edt_field.text)+'''字段！！ ');
           self.edt_Field.text:='';
          self.edt_Field.SetFocus;
          exit;
       end;

       end;

   with dbgrdhModel.Columns.add do
   begin


     title.caption :=trim(edt_field.text);
     edt_field.text:='';
   end;


end;

procedure TFrmModel.btnDel2Click(Sender: TObject);
begin
 dbgrdhModel.Columns.Delete(dbgrdhModel.Columns.Count - 1);
end;

procedure TFrmModel.btnGetFieldClick(Sender: TObject);

begin
 PMfield.popup(mouse.CursorPos.x,mouse.CursorPos.y);

end;

procedure TFrmModel.FormShow(Sender: TObject);
var i : integer;
 item: TmenuItem;
begin
   //添加字段到popmenu

   for i:=0 to frmMain.dbgrdhDetail.Columns.Count-1 do
     begin
       item:=TMenuItem.Create(self);
       item.Caption:=  frmMain.dbgrdhDetail.Columns[i].Title.Caption;
       item.OnClick:=item_click;
       pmfield.items.add(item);

     end;
     //另外加一个
        item := TmenuItem.Create(self) ;
      item.Caption := '离职类型' ;
      item.OnClick := item_click ;
      pmfield.Items.Add(item) ;

      
end;

procedure TFrmModel.btnCancelClick(Sender: TObject);
begin
close;
end;

end.
