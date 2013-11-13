--Ѱ������

--MisDescBegin
x207004_g_ScriptId = 207004
x207004_g_MissionIdPre =4
x207004_g_MissionId = 5
x207004_g_MissionKind = 1
x207004_g_ScriptIdNext = {ScriptId = 207005 ,LV = 1 }
x207004_g_Name	="������" 
x207004_g_Name2	="������" 
x207004_g_DemandItem ={id=13010010,num=1}
x207004_g_noDemandKill ={{id=420,num=1},{id=421,num=1},{id=422,num=1}}	

x207004_g_MissionName="Ѱ������"
x207004_g_MissionInfo="    �ڹ���#G����Ӫ#W��ʱ����Ů�˱��Ҽ��������ˣ�#G����#W������Ů�˵�ʱ�򣬰�������Ҳ����һ�����ˡ���õ��񰡣�ֵǮ������#G����#W������~����~�����ǵĻ������ˣ�\n \nֻ�ǣ�������ߵ����������õ�������ģ����ǲ���˵�ģ�����������ޣ����������ˣ�ǰ����#G������#W���ҺȾƵ�ʱ���ƺ�Ҳ�����ˡ���������Ե������ߣ��������ߵ��˻�������ͬ��������������˹������ģ����˵Ļ������ܴ����������ҵ�һЩʲô������#G������#W���ܻ����𰸡�"  --��������
x207004_g_MissionTarget="    �ҵ�#R������#W�������������ҵ�Щ������Ȼ���#G������#W��������"		
x207004_g_MissionComplete="    �������������Щ������ߵ�#R������#W�����ҵ��ģ�"					--�������npc˵���Ļ�
x207004_g_ContinueInfo="    ��Щ#R������#W��Ҳ��̫�˽⣬������������������ҵ�Щ�������Ҵ�������"
--������
x207004_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x207004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207004_g_RadioItemBonus={}

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x207004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207004_g_MissionId) > 0 then
		if x207004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207004_g_MissionName)
			AddText(sceneId,x207004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207004_g_MissionTarget) 
			AddText(sceneId,format("\n    �ʲݵ���   %d/1", LuaFnGetItemCount(sceneId,selfId,13010010) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207004_g_MissionName)
		     AddText(sceneId,x207004_g_MissionComplete)
		     AddText(sceneId,"#Y����Ŀ��#W") 
		     AddText(sceneId,x207004_g_MissionTarget) 
		     AddText(sceneId,format("\n    �ʲݵ���   %d/1", LuaFnGetItemCount(sceneId,selfId,13010010) ))
                     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207004_g_ScriptId, x207004_g_MissionId)
                end

        elseif x207004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207004_g_MissionName)
                AddText(sceneId,x207004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207004_g_ScriptId, x207004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207004_g_ScriptId, x207004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207004_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207004_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207004_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207004_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207004_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207004_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207004_OnAccept(sceneId, selfId)

	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207004_g_MissionId, x207004_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207004_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
		                                                           
	                                                                     
	     
end



--**********************************

--����

--**********************************







function x207004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207004_g_MissionId)
	for i, item in pairs(x207004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207004_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,13010010) == 1 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207004_g_MissionId)
		AddExp(sceneId, selfId, x207004_g_ExpBonus)
		AddMoney(sceneId, selfId, x207004_g_MoneyBonus)
		for i, item in pairs(x207004_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207004_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207004_g_MissionId) >= 0 then   
       		 if objdataId == x207004_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,13010010) < 1 then
       		         if random(1,100)>10 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207004_g_DemandItem.id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�ʲݵ���   %d/1", LuaFnGetItemCount(sceneId,selfId,13010010)+1 )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
      		 if objdataId == x207004_g_noDemandKill[2].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,13010010) < 1 then
       		         if random(1,100)>10 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207004_g_DemandItem.id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�ʲݵ���   %d/1", LuaFnGetItemCount(sceneId,selfId,13010010)+1 )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
       		 if objdataId == x207004_g_noDemandKill[3].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,13010010) < 1 then
       		         if random(1,100)>10 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207004_g_DemandItem.id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�ʲݵ���   %d/1", LuaFnGetItemCount(sceneId,selfId,13010010)+1 )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207004_OnItemChanged(sceneId, selfId, itemdataId)

end

