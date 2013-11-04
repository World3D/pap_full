--�����ܾ�

--�ɼ�˼��

--�ű���
x207008_g_ScriptId = 207008

--��һ�������ID
x207008_g_MissionIdPre =6

--�����
x207008_g_MissionId = 9

--����Ŀ��npc
x207008_g_Name	="������" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207008_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207008_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
--x207008_g_MissionItem = {{id=10400001,num=1}}

--������Ҫɱ���Ĺ�
x207008_g_DemandKill ={{id=4001,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207008_g_MissionName="�����ڵ�Ů��"
x207008_g_MissionInfo="��ϲ����Ѿ�׼�����ˣ�������Ů����������ҵ�Ů�˱��������ŷ����ʯ�����ˣ�����������ϱߣ�135,225��λ���ߡ������Ҫ���ҵ�Ů����������"  --��������
x207008_g_MissionTarget="���ŷ����ʯ�Ȼذ����ڵ�Ů�ˣ�Ȼ���������̸̸��"		--����Ŀ��
x207008_g_ContinueInfo="Ů�������������ϣ�û�к��³�����Ķ���Ҫ�졣"		--δ��������npc�Ի�
x207008_g_MissionComplete="лл���Һ��㼰ʱ������Ҫ������һ��������������롣"					--�������npc˵���Ļ�
--x207008_g_MissionAddItem="�õ������ܱ�"		
--x207008_g_szBackageFull = "����������"
--������
x207008_g_MoneyBonus=20000
x207008_g_ItemBonus={{id=12040002,num=1}}
x207008_g_RadioItemBonus={{id=12010001,num=1},{id=12020001,num=1}}
x207008_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207008_g_MissionId) > 0 then
	         if  x207008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId,x207008_g_ContinueInfo) 
		     EndEvent()

		     local bDone = x207008_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207008_g_ScriptId, x207008_g_MissionId, bDone)
		 end
		if  x207008_CheckSubmit(sceneId, selfId, targetId) > 0 then
		    BeginEvent(sceneId)
	            AddText(sceneId, x207008_g_MissionName)
                    AddText(sceneId,x207008_g_MissionComplete)
                    AddMoneyBonus(sceneId, x207008_g_MoneyBonus)
                    for i, item in x207008_g_ItemBonus do
	            AddItemBonus(sceneId, item.id, item.num)
	            for i, item in x207008_g_RadioItemBonus do
	            AddRadioItemBonus(sceneId, item.id, item.num)
		    end
	            end
                    EndEvent()
                    DispatchMissionContinueInfo(sceneId, selfId, targetId, x207008_g_ScriptId, x207008_g_MissionId)
                end
		    
        elseif x207008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207008_g_MissionName, x207008_g_MissionInfo, x207008_g_MissionTarget, x207008_g_ItemBonus, x207008_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207008_g_ScriptId, x207008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207008_g_ScriptId, x207008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207008_CheckAccept(sceneId, selfId, targetId)

	if IsMissionHaveDone(sceneId, selfId, x207008_g_MissionIdPre) > 0 then
	    return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207008_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207008_g_MissionIdPre) > 0 then
                    return 1
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x207008_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207008_g_MissionId, x207008_g_ScriptId, 1, 0, 0)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������
end



--**********************************

--����

--**********************************

function x207008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207008_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207008_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207008_g_MissionId) >= 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
	     if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
		return 1
	     end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207008_OnSubmit(sceneId, selfId, targetId, selectRadioId)
 
        if x207008_CheckSubmit( sceneId, selfId, selectRadioId ) then            
    	BeginAddItem(sceneId)                                                    
			for i, item in x207008_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x207008_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		--���������                                                   
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x207008_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x207008_g_MissionId )
				               
				AddExp(sceneId, selfId, x207008_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x207008_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
		--������û�мӳɹ�                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end                                                              
	end                                                                      
	     EndEvent(sceneId)
	     
end


                                                                                                 
function x207008_OnKillObject(sceneId, selfId, objdataId)                                        
         if objdataId == x207008_g_DemandKill[1].id then 
         misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)                                        
         num = GetMissionParam(sceneId,selfId,misIndex,0)                                        
             if num<=0  then                                                                     
             BeginEvent(sceneId)                                                                 
             SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)                                  
	     strText = "�Ѵ��ŷ����ʯ1/1"
	     AddText(sceneId, strText) 
             EndEvent()
	   DispatchMissionTips(sceneId, selfId)
             end
         end
end                    




--**********************************

--���������¼�

--**********************************

function x207008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207008_OnItemChanged(sceneId, selfId, itemdataId)

end

