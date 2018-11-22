unit UAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGridEh, DB, ADODB, Menus;

type
  TFrmAdd = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    mniReCheck: TMenuItem;
    N2: TMenuItem;
    ds_add: TDataSource;
    qry_add: TADOQuery;
    dbgrdh1: TDBGridEh;
    atncfld_mainrkey: TAutoIncField;
    intgrfld_mainCID: TIntegerField;
    intgrfld_mainProdNo: TIntegerField;
    strngfld_mainlayer: TStringField;
    strngfld_mainMachine: TStringField;
    intgrfld_mainPID: TIntegerField;
    intgrfld_mainStackNum: TIntegerField;
    strngfld_maindept_code: TStringField;
    strngfld_maindept_name: TStringField;
    strngfld_addmanu_part_number: TStringField;
    qry_value: TADOQuery;
    pnl4: TPanel;
    btn_save: TButton;
    btn_cancel: TButton;
    intgrfld_addAMan: TIntegerField;
    dtmfld_addAdate: TDateTimeField;
    pm_TTime: TPopupMenu;
    N4: TMenuItem;
    lbl7: TLabel;
    cbb_craft: TComboBox;
    qry_save: TADOQuery;
    atncfld_saverkey: TAutoIncField;
    intgrfld_saveCID: TIntegerField;
    intgrfld_saveProdNo: TIntegerField;
    strngfld_savelayer: TStringField;
    strngfld_saveMachine: TStringField;
    intgrfld_savePID: TIntegerField;
    intgrfld_saveStackNum: TIntegerField;
    intgrfld_saveAMan: TIntegerField;
    dtmfld_saveAdate: TDateTimeField;
    strngfld_adduser_full_name: TStringField;
    lbl1: TLabel;
    Label1: TLabel;
    intgrfld_addTCTTIme1: TIntegerField;
    fltfld_addCTTime1: TFloatField;
    fltfld_addCTTime2: TFloatField;
    intgrfld_saveTCTTIme1: TIntegerField;
    fltfld_saveCTTime1: TFloatField;
    fltfld_saveCTTime2: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1EditButtonClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure dbgrdh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdh1ColExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdd: TFrmAdd;

implementation
        uses UDM, Pick_Item_Single,ConstVar,common, UTimeDetail;
{$R *.dfm}

procedure TFrmAdd.FormShow(Sender: TObject);
var ssql : string;
begin

 if not qry_add.Active  then qry_add.Open;

 ssql:='select rkey,cname from data0578 order by rkey';
 dm.openqry(dm.qry_temp,ssql);
 if not dm.qry_temp.isempty then
 begin
    with dm.qry_temp do
    begin
     First;
     cbb_craft.Items.Clear;
     while not eof do
     begin
     cbb_craft.Items.AddObject(fieldbyname('cname').AsString,TObject(fieldbyname('rkey').AsInteger));
     Next;
     end;
    end;
    cbb_craft.ItemIndex:=0;
 end;

end;

procedure TFrmAdd.dbgrdh1EditButtonClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  im: integer;
  ssql: string;
begin

  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    try

    with (Sender  as TDBGridEh) do
     begin
       qry_add.edit;
       if SelectedField.FieldName='manu_part_number' then
       begin
        InputVar.Fields := 'manu_part_number/本厂编号/150,manu_part_desc/品号名称/200,layers/层数/100,rkey/ID/50';
        InputVar.Sqlstr := ' select   manu_part_number,manu_part_desc,layers ,rkey   from data0025 ';
        InputVar.AdoConn :=dm.con1;
        InputVar.KeyField:='rkey';
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          im  := integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]);
          Fields[1].Text:= inttostr(im);
          Fields[2].Text:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asstring;
          Fields[3].Text:= frmPick_Item_Single.adsPick.fieldbyname('manu_part_number').asstring;
          Fields[4].Text:= frmPick_Item_Single.adsPick.fieldbyname('layers').asstring;
        end ;
       end
       else if (SelectedField.FieldName='Machine')  then
       begin
         if (trim(cbb_craft.text)<>'镭射嫁动率' ) then
         begin
         showmessage('只有镭射才可以输入机台!');
         exit;
         end;
        InputVar.Fields := 'cid/ID/50,MName/本厂编号/100';
        InputVar.Sqlstr := ' select   cid , MName  from data0580 ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          Fields[5].Text:= frmPick_Item_Single.adsPick.fieldbyname('MName').asstring;
        end ;
       end
        else if SelectedField.FieldName='dept_code'   then
       begin
         if  (qry_add.Fields[2].Text='')  then
         begin
         showmessage('请先选择本厂编号!');
         exit;
         end;
        InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50';
        InputVar.Sqlstr := ' select  dept_code, dept_name,rkey from data0034 where rkey in (select pid from data0579 where cid='+inttostr(integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]))+' )';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          Fields[6].Text:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asstring;
          Fields[7].Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_code').asstring;
          Fields[8].Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_name').asstring;
          //得到品号和工序后可得到stacknum

         //叠板数： 
          with  qry_value do
          begin
           Close;
           parameters.parambyname('rkey').value:= qry_add.Fields[2].Text;
           parameters.parambyname('rkey2').value:= qry_add.Fields[6].Text;
           if   trim(cbb_craft.Text)='钻孔嫁动率' then
           parameters.parambyname('pName').value:='钻孔叠板数'
           else if  trim(cbb_craft.Text)='锣房嫁动率' then
           parameters.parambyname('pName').value:='锣板叠板数'
           else
            parameters[2].value:='';
           open;
           if  ( qry_value.FieldByName('parameter_value').value<>'') and  ( qry_value.FieldByName('parameter_value').value<>null)  then
           dbgrdh1.Fields[9].Text:=IntToStr(qry_value.FieldByName('parameter_value').asinteger);
          end;
          
        //理论CT时间
           with  qry_value do
          begin
           Close;
           parameters.parambyname('rkey').value:= qry_add.Fields[2].Text;
           Parameters.parambyname('rkey2').value:= qry_add.Fields[6].Text;
           parameters.parambyname('pName').value:='锣板理论CT时间';
           open;
           if  ( qry_value.FieldByName('parameter_value').value<>'') and ( qry_value.FieldByName('parameter_value').value<>null)  then
           dbgrdh1.Fields[10].Text:=IntToStr(qry_value.FieldByName('parameter_value').asinteger);
          end;
          ssql:=' select rkey, user_full_name from data0073 where  rkey='+rkey73+'';
          dm.openqry(dm.qry_temp,ssql);
            dbgrdh1.SelectedIndex:=11;

        dbgrdh1.Fields[13].Text:= rkey73;
         dbgrdh1.Fields[14].Text:= dm.qry_temp.FieldByName('user_full_name').asstring;
         dbgrdh1.Fields[15].Text:= FormatDateTime('yyyy-MM-dd hh:mm:ss',now);
        end ;
       end


     end;


   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
   end;

  finally
   // if  frmPick_Item_Single.adsPick.Active  then
    //frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrmAdd.btn_cancelClick(Sender: TObject);
begin
close;
end;

procedure TFrmAdd.btn_saveClick(Sender: TObject);
var
  i:Integer;
begin
  if not qry_add.IsEmpty then
 //qry_add.UpdateBatch(arAll);


 try
  
    qry_save.close;
     qry_save.open;


qry_add.First;
while not qry_add.Eof do
 begin
  qry_save.Append;
  qry_save.FieldByName('cid').value:=integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]); // qry_add.fieldbyname('cid').asinteger;
  qry_save.FieldByName('prodno').value:= qry_add.fieldbyname('prodno').asinteger;
  qry_save.FieldByName('layer').value:= qry_add.fieldbyname('layer').asinteger;
  qry_save.FieldByName('machine').value:= qry_add.fieldbyname('machine').value;
  qry_save.FieldByName('pid').value:= qry_add.fieldbyname('pid').asinteger;
  qry_save.FieldByName('stacknum').value:= qry_add.fieldbyname('stacknum').asinteger;
  qry_save.FieldByName('tcttime1').value:= qry_add.fieldbyname('tcttime1').asinteger;
  qry_save.FieldByName('cttime1').value:= qry_add.fieldbyname('cttime1').AsFloat;
  qry_save.FieldByName('cttime2').value:= qry_add.fieldbyname('cttime2').AsFloat;
  qry_save.FieldByName('aman').value:= strtoint(rkey73); // qry_add.fieldbyname('aman').asinteger;
  qry_save.FieldByName('adate').value:= qry_add.fieldbyname('adate').asdatetime;

  if (Trim(cbb_craft.Text)='镭射嫁动率' )   then
  begin
   if (qry_add.fieldbyname('machine').asstring='')  then
   begin
    showmessage('镭射机台不允许为空!!');
   Exit;
   end;

   if (qry_add.fieldbyname('cttime1').AsFloat=0) and (qry_add.fieldbyname('cttime2').AsFloat=0)   then
   begin
    showmessage('镭射S面和C面CT时间不能都为o!!');
   Exit;
   end
  end
   else   if (Trim(cbb_craft.Text)='钻孔嫁动率' ) or  (Trim(cbb_craft.Text)='锣板嫁动率' )    then
   begin
   if (qry_add.fieldbyname('cttime1').AsFloat=0) then
   begin 
   showmessage('CT时间不能为o!!');
   Exit;
   end;
   end; 
 qry_save.post;
 qry_add.next;
 end;

  qry_save.UpdateBatch(arall);
  FrmTimeDetail.btn_refreshClick(Sender);
   close;
  except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TFrmAdd.dbgrdh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var ssql: string;
  im:integer;
begin
 if   Key<>13 then Exit;

 try

 begin
  if (dbgrdh1.SelectedIndex=3) then  //品号       // and (dbgrdh1.Fields[3].Text<>'')
  begin
    dbgrdh1.SelectedIndex:= 5;
    if   (dbgrdh1.Fields[3].Text<>'') then
    begin
    ssql:= ' select   manu_part_number,manu_part_desc,layers ,rkey   from data0025  where manu_part_number='''+dbgrdh1.Fields[3].Text+''' ';
    dm.OpenQry(dm.qry_temp,ssql);
    if not dm.qry_temp.IsEmpty  then
     begin
        im  := integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]);
          dbgrdh1.Fields[1].Text:= inttostr(im);
          dbgrdh1.Fields[2].Text:=DM.qry_temp.fieldbyname('rkey').asstring;
          //dbgrdh1.Fields[3].Text:= DM.qry_temp.fieldbyname('manu_part_number').asstring;
          dbgrdh1.Fields[4].Text:= DM.qry_temp.fieldbyname('layers').asstring;
     end;
     dbgrdh1.SelectedIndex:= 5;
    end;
  end
  else  if (dbgrdh1.SelectedIndex=5) then  //机台
  begin

     dbgrdh1.SelectedIndex:= 7;

  end
  else  if (dbgrdh1.SelectedIndex=7) then  //工序
  begin
    dbgrdh1.SelectedIndex:= 11;
    if   (dbgrdh1.Fields[7].Text<>'') then
    begin
     if  (qry_add.Fields[2].Text='')  then
         begin
         showmessage('请先选择本厂编号!');
         exit;
         end;
        ssql := ' select  dept_code, dept_name,rkey from data0034 where dept_code='''+dbgrdh1.Fields[7].Text+''' ';
         dm.OpenQry(dm.qry_temp,ssql) ;
         
         if not dm.qry_temp.IsEmpty then
        begin
          dbgrdh1.Fields[6].Text:= DM.qry_temp.fieldbyname('rkey').asstring;
          //dbgrdh1.Fields[7].Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_code').asstring;
          dbgrdh1.Fields[8].Text:= DM.qry_temp.fieldbyname('dept_name').asstring;

          //得到品号和工序后可得到stacknum
          with  qry_value do
          begin
           Close;
           parameters.parambyname('rkey').value:= qry_add.Fields[2].Text;
           parameters.parambyname('rkey2').value:= qry_add.Fields[6].Text;
           if   trim(cbb_craft.Text)='钻孔嫁动率' then
           parameters.parambyname('pName').value:='钻孔叠板数'
           else if  trim(cbb_craft.Text)='锣房嫁动率' then
           parameters.parambyname('pName').value:='锣板叠板数'
           else
            parameters[2].value:='';
           open;
           if  qry_value.FieldByName('parameter_value').value<>'' then
           dbgrdh1.Fields[9].Text:=IntToStr(qry_value.FieldByName('parameter_value').asinteger);
          end;
        //理论CT时间
           with  qry_value do
          begin
           Close;
           parameters.parambyname('rkey').value:= qry_add.Fields[2].Text;
           Parameters.parambyname('rkey2').value:= qry_add.Fields[6].Text;
           parameters.parambyname('pName').value:='锣板理论CT时间';
           open;
           if   qry_value.FieldByName('parameter_value').value<>'' then
           dbgrdh1.Fields[10].Text:=IntToStr(qry_value.FieldByName('parameter_value').asinteger);
          end;
          ssql:=' select rkey, user_full_name from data0073 where  rkey='+rkey73+'';
          dm.openqry(dm.qry_temp,ssql);

        dbgrdh1.Fields[13].Text:= rkey73;
         dbgrdh1.Fields[14].Text:= dm.qry_temp.FieldByName('user_full_name').asstring;
         dbgrdh1.Fields[15].Text:= FormatDateTime('yyyy-MM-dd hh:mm:ss',now);
        end ;
     end;

  end

 end;

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TFrmAdd.dbgrdh1ColExit(Sender: TObject);
var
  ssql: string;
  im:integer;
begin
//
  with (Sender  as TDBGridEh) do
  begin
   try

  begin
  if (dbgrdh1.SelectedIndex=3) then  //品号       // and (dbgrdh1.Fields[3].Text<>'')
  begin
    dbgrdh1.SelectedIndex:= 5;
    if   (dbgrdh1.Fields[3].Text<>'') then
    begin

    ssql:= ' select   manu_part_number,manu_part_desc,layers ,rkey   from data0025  where manu_part_number='''+dbgrdh1.Fields[3].Text+''' ';
    dm.OpenQry(dm.qry_temp,ssql);
    if not dm.qry_temp.IsEmpty  then
     begin
        im  := integer(cbb_craft.Items.Objects[cbb_craft.ItemIndex]);
          dbgrdh1.Fields[1].Text:= inttostr(im);
          dbgrdh1.Fields[2].Text:=DM.qry_temp.fieldbyname('rkey').asstring;
          //dbgrdh1.Fields[3].Text:= DM.qry_temp.fieldbyname('manu_part_number').asstring;
          dbgrdh1.Fields[4].Text:= DM.qry_temp.fieldbyname('layers').asstring;
     end;
     dbgrdh1.SelectedIndex:= 5;
    end;
  end
  else  if (dbgrdh1.SelectedIndex=5) then  //机台
  begin

     dbgrdh1.SelectedIndex:= 7;

  end
  else  if (dbgrdh1.SelectedIndex=7) then  //工序
  begin
    dbgrdh1.SelectedIndex:= 11;
    if   (dbgrdh1.Fields[7].Text<>'') then
    begin
     if  (qry_add.Fields[2].Text='')  then
         begin
         showmessage('请先选择本厂编号!');
         exit;
         end;
        ssql := ' select  dept_code, dept_name,rkey from data0034 where dept_code='''+dbgrdh1.Fields[7].Text+''' ';
         dm.OpenQry(dm.qry_temp,ssql) ;
         
         if not dm.qry_temp.IsEmpty then
        begin
          dbgrdh1.Fields[6].Text:= DM.qry_temp.fieldbyname('rkey').asstring;
          //dbgrdh1.Fields[7].Text:= frmPick_Item_Single.adsPick.fieldbyname('dept_code').asstring;
          dbgrdh1.Fields[8].Text:= DM.qry_temp.fieldbyname('dept_name').asstring;

          //叠板数
          with  qry_value do
          begin
           Close;
           parameters.parambyname('rkey').value:= qry_add.Fields[2].Text;
           parameters.parambyname('rkey2').value:= qry_add.Fields[6].Text;
           if   trim(cbb_craft.Text)='钻孔嫁动率' then
           parameters.parambyname('pName').value:='钻孔叠板数'
           else if  trim(cbb_craft.Text)='锣房嫁动率' then
           parameters.parambyname('pName').value:='锣板叠板数'
           else
            parameters[2].value:='';
           open;
          if  ( qry_value.FieldByName('parameter_value').value<>'') and ( qry_value.FieldByName('parameter_value').value<>null)  then
           dbgrdh1.Fields[9].Text:=IntToStr(qry_value.FieldByName('parameter_value').asinteger);
          end;

        //理论CT时间
           with  qry_value do
          begin
           Close;
           parameters.parambyname('rkey').value:= qry_add.Fields[2].Text;
           Parameters.parambyname('rkey2').value:= qry_add.Fields[6].Text;
           parameters.parambyname('pName').value:='锣板理论CT时间';
           open;
          if  ( qry_value.FieldByName('parameter_value').value<>'') and ( qry_value.FieldByName('parameter_value').value<>null)  then
           dbgrdh1.Fields[10].Text:=IntToStr(qry_value.FieldByName('parameter_value').asinteger);
          end;
          ssql:=' select rkey, user_full_name from data0073 where  rkey='+rkey73+'';
          dm.openqry(dm.qry_temp,ssql);

        dbgrdh1.Fields[13].Text:= rkey73;
         dbgrdh1.Fields[14].Text:= dm.qry_temp.FieldByName('user_full_name').asstring;
         dbgrdh1.Fields[15].Text:= FormatDateTime('yyyy-MM-dd hh:mm:ss',now);
        end ;
     end;

  end

  end;

   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
   end;



  end;
end;

end.
