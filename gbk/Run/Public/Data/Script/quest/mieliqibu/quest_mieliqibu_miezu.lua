--����

--MisDescBegin
x201011_g_ScriptId = 201011
x201011_g_MissionIdPre =92
x201011_g_MissionId = 93
x201011_g_MissionKind = 2
x201011_g_MissionLevel = 10
--x201011_g_ScriptIdNext = {ScriptId = 201002 ,LV = 1 }
x201011_g_Name	="���չ�̨" 
x201011_g_DemandItem ={}
x201011_g_DemandKill ={{id=476,num=20}}

x201011_g_MissionName="����"
x201011_g_MissionInfo="    <���չ�̨��֪�Լ���ĸ�ױ������ɱ������ɱ�˺ܶ����޴������������ˣ�����������ͷ�����������侲�����������ﾡ�ǳ�޵�ŭ��>ɱ���������ˣ�������Ů���٣�ɱ�������ǵĲ�����Զ�ڲ�ԭ����ʧ��\n \n    ��Щ����Ϊ������ͨ���#Rа����ʦ#WҲ��Ҫ�Ź����������������ˣ��;ۼ���#G������#W�ҽǵ�һ��ɽ���"  --��������
x201011_g_MissionTarget="    ɱ��#G������#W���ϵ�20��#Rа����ʦ#W��ƽϢ#G���չ�̨#W��ŭ��"		                                                                                               
x201011_g_MissionComplete="    �����ĺ��Ѻӣ������ҵ�ĸ���ٳలϢ�ɡ�"					--�������npc˵���Ļ�
x201011_g_ContinueInfo="    ��Ҫ�����κ�һ���������ˣ���Щ��ʦҲһ����"
--������
x201011_g_MoneyBonus = 2
--�̶���Ʒ���������8��
x201011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201011_g_RadioItemBonus={{id=10276001,num=1},{id=10256001,num=1},{id=10246001,num=1}}

--MisDescEnd
x201011_g_ExpBonus = 80
--**********************************

--������ں���

--**********************************

function x201011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201011_g_MissionId)
		if x201011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201011_g_MissionName)
			AddText(sceneId,x201011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��а����ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201011_g_MissionName)
		     AddText(sceneId,x201011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x201011_g_MoneyBonus)
		     for i, item in pairs(x201011_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in pairs(x201011_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201011_g_ScriptId, x201011_g_MissionId)
                end

        elseif x201011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201011_g_MissionName)
                AddText(sceneId,x201011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201011_g_MoneyBonus)	
		for i, item in pairs(x201011_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in pairs(x201011_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201011_g_ScriptId, x201011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201011_g_ScriptId, x201011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
		if IsMissionHaveDone(sceneId, selfId, x201011_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201011_g_MissionId, x201011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201011_g_MissionId)
	for i, item in pairs(x201011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x201011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in pairs(x201011_g_ItemBonus) do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in pairs(x201011_g_RadioItemBonus) do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x201011_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x201011_g_MissionId )
				AddExp(sceneId, selfId, x201011_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x201011_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end
		--CallScriptFunction( x201011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	

	
end



--**********************************

--ɱ����������

--**********************************

function x201011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x201011_g_DemandKill[1].id then 
       		    if num < x201011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��а����ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x201011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201011_OnItemChanged(sceneId, selfId, itemdataId)

end

